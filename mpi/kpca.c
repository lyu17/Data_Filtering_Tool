#include "kpca.h"

void exchange(float *m, int i, int j)
{
	float tmp = m[i];
	m[i] = m[j];
	m[j] = tmp;
}

void selectionsort(float *A, float **v)
{
	int maxindex;
	int i, j, k;
	for(i=0; i<rows-1; i++)
	{
		maxindex = i;
		for(j=i+1; j<rows; j++)
		{
			if(A[j]>A[maxindex])
			{
				maxindex = j;
			}
		}
		exchange(A, i, maxindex);
		for(k=0; k<rows; k++)
		{
			exchange(v[k], i, maxindex);
		}

	}
}

float product(float *a, float *b, int size)
{
	int i;
	float sum = 0;
	for(i=0; i<size; i++)
	{
		sum += a[i]*b[i];
	}
	return sum;
}

float kernel(float var, float *x, float *y, int sign)
{
	int i;
	float t, s = 0;
	if(sign==1)
	{
		for(i=0; i<cols; i++)
		{
			x[i] = x[i]-y[i];
		}
		t = product(x,x,cols);
		s = exp(-t/(2*var*var));
	}
	else if(sign==2)
	{
		t = product(x,y,cols);
		s = t;
	}
	return s;
}

void get_kernel_mat(float **a, float var, int sign, float **k)
{
	int i, j, m;
	float *x, *y;
	x = calloc(cols,sizeof(float));
	y = calloc(cols,sizeof(float));
	for(i=0; i<rows; i++)
	{
		for(j=0; j<rows; j++)
		{
			for(m=0; m<cols; m++)
			{
				x[m]=a[i][m];
				y[m]=a[j][m];
			}
			k[i][j] = kernel(var, x, y, sign);
		}
	}
	free(x);
	free(y);
}

void modify_kernel_mat(float **k, float **kl)
{
	int i, j, m;
	float s1, s2, s3 = 0;
	for(i=0; i<rows; i++)
	{
		for(j=0; j<rows; j++)
		{
			s3 += k[i][j];
		}
	}
	for(i=0; i<rows; i++)
	{
		for(j=0,s1=0; j<rows; j++)
		{
			s1 += k[i][j];
		}
		for(j=0; j<rows; j++)
		{
			for(m=0,s2=0; m<rows; m++)
			{
				s2 += k[m][j];
			}
			kl[i][j] = k[i][j] - s1/rows - s2/rows + s3/(rows*rows);
		}
	}
}

int jacobi(float **a, float **v, float eps, int jt)
{
	int i, j, p, q, l;
	float fm, cn, sn, omega, x, y, d;
	l=1;
	for(i=0; i<rows; i++)
	{
		v[i][i] = 1.0;
		for(j=0; j<rows; j++)
		{
			if(i!=j)
			{
				v[i][j] = 0;
			}
		}
	}
	while(1)
	{
		fm = 0.0;
		for(i=0; i<=rows-1; i++)
		{
			for(j=0; j<=i-1; j++)
			{
				d = fabs(a[i][j]);
				if(i!=j && d>fm)
				{
					fm = d;
					p = i;
					q = j;
				}
			}
		}
		if(fm<eps)
		{
			return 1;
			break;
		}
		if(l>jt)
		{
			return -1;
			break;
		}
		l = l+1;
		x = -a[p][q];
		y = (a[q][q]-a[p][p])/2.0;
		omega = x/sqrt(x*x+y*y);
		if(y<0.0)
		{
			omega=-omega;
		}
		sn = 1.0 + sqrt(1.0-omega*omega);
		sn = omega / sqrt(2.0*sn);
		cn = sqrt(1.0 - sn*sn);
		fm = a[p][p];
		a[p][p] = fm*cn*cn + a[q][q]*sn*sn + a[p][q]*omega;
		a[q][q] = fm*sn*sn + a[q][q]*cn*cn - a[p][q]*omega;
		a[p][q] = y*omega + a[p][q]*(2*cn*cn-1);
		a[q][p] = a[p][q];
		for(j=0; j<=rows-1; j++)
		{
			if(j!=p && j!=q)
			{
				fm = a[p][j];
				a[p][j] = fm*cn + a[q][j]*sn;
				a[q][j] = -fm*sn + a[q][j]*cn;
			}
		}
		for(i=0; i<=rows-1; i++)
		{
			if(i!=p && i!=q)
			{
				fm = a[i][p];
				a[i][p] = fm*cn + a[i][q]*sn;
				a[i][q] = -fm*sn + a[i][q]*cn;
			}
		}
		for(i=0; i<=rows-1; i++)
		{
			fm = v[i][p];
			v[i][p] = fm*cn + v[i][q]*sn;
			v[i][q] = -fm*sn + v[i][q]*cn;
		}
	}
}

void orthogonalize(float **v)
{
	int i, j, k, t;
	float **b;
	float *xx, *yy;
	b = calloc(rows,sizeof(float*));
	for(i=0; i<rows; i++)
	{
		b[i] = calloc(rows,sizeof(float));
	}
	xx = calloc(rows,sizeof(float));
	yy = calloc(rows,sizeof(float));
	for(i=0; i<rows; i++)
	{
		b[i][0] = v[i][0];
	}
	for(j=1; j<rows; j++)
	{
		for(i=0; i<rows; i++)
		{
			for(k=0; k<j; k++)
			{
				for(t=0; t<rows; t++)
				{
					xx[t] = b[t][k];
					yy[t] = v[t][j];
				}
		    	b[i][j] = v[i][j] - product(xx,yy,rows) / product(xx,xx,rows) * b[i][k];
			}
		}
	}
	for(i=0; i<rows; i++)
	{
		for(j=0; j<rows; j++)
		{
			xx[j] = b[j][i];
		}
		yy[i] = sqrt(product(xx,xx,rows));
	}
	for(i=0; i<rows; i++)
	{
		for(j=0; j<rows; j++)
		{
			v[i][j] = b[i][j] / yy[j];
		}
	}
	for(i=0; i<rows; i++)
	{
		free(b[i]);
	}
	free(b);
	free(xx);
	free(yy);
}

int selectcharactor(float *A, float getratio, float *B)
{
	int i;
	float s = 0;
	for(i=0; i<rows; i++)
	{
		s = s + A[i];
	}
	B[0] = A[0] / s;
	for(i=1; i<rows; i++)
	{
		B[i] = B[i-1] + A[i]/s;
	}
	if(getratio>1 || getratio<0)
	{
		return -1;
	}
	for(i=0; i<rows; i++)
	{
	    if(B[i]>=getratio)
		{
		   return i+1;
	       break;
		}

	}
	if(getratio>B[rows-1])
	{
		return -1;
	}
	return 0;
}

void get_project(int t, float **x, float **v, float **p)
{
	int i, j, k;
	for(i=0; i<rows; i++)
	{
		for(j=0; j<t; j++)
		{
			for(k=0; k<rows; k++)
			{
			   p[i][j] += x[i][k] * v[k][j];
			}
		}
	}
}

void initialize_kpca(int num_row, int num_col)
{
	rows = num_row;
	cols = num_col;
	int i;
	A = calloc(rows,sizeof(float));
	B = calloc(rows,sizeof(float));
	K = calloc(rows,sizeof(float*));
	for(i=0; i<rows; i++)
	{
		K[i] = calloc(rows,sizeof(float));
	}
	KL = calloc(rows,sizeof(float*));
	for(i=0; i<rows; i++)
	{
		KL[i] = calloc(rows,sizeof(float));
	}
	c = calloc(rows,sizeof(float*));
	for(i=0; i<rows; i++)
	{
		c[i] = calloc(rows,sizeof(float));
	}
	v = calloc(rows,sizeof(float*));
	for(i=0; i<rows; i++)
	{
		v[i] = calloc(rows,sizeof(float));
	}
}

void release_kpca()
{
	int i;
	for(i=0; i<rows; i++)
	{
		free(K[i]);
		free(KL[i]);
		free(c[i]);
		free(v[i]);
	}
	free(K);
	free(KL);
	free(c);
	free(v);
	free(A);
	free(B);
}

void kpca(float **data, int num_row, int num_col, int project_dim, float **project_data)
{
	int i, j;
	initialize_kpca(num_row, num_col);
	get_kernel_mat(data,GAUSS_PARA,1,K);
	modify_kernel_mat(K,KL);
	for(i=0; i<rows; i++)
	{
		for(j=0; j<rows; j++)
		{
			c[i][j] = KL[i][j];
		}
	}
	jacobi(c,v,EPS,10000);
	for(i=0; i<rows; i++)
	{
		A[i] = c[i][i];
	}
/*	for(i=0; i<rows; i++)
	{
		for(j=0; j<rows; j++)
		{
			printf("%f ",v[i][j]);
		}
		printf("\n");
	}*/
	orthogonalize(v);
	selectionsort(A,v);
	get_project(project_dim,KL,v,project_data);
	release_kpca();
}

/*int main(void) {
	int i, j;
	float M[4][8] = { { 1.5, 2.5, 3.5, 1.2, 1.2, 1.2, 1.2, 1.2 },
			          { 1.5, 2.6, 3.5, 1.2, 1.2, 1.2, 1.2, 1.2 },
					  { 1.6, 2.5, 3.5, 1.2, 1.2, 1.2, 1.2, 1.2 },
					  { 2.5, 3.5, 1.5, 1.2, 1.2, 1.2, 1.2, 1.2 } };


	float **data, **pdata;

	data = calloc(4,sizeof(float*));
	for(i=0; i<4; i++)
	{
		data[i] = calloc(8,sizeof(float));
	}
	for(i=0; i<4; i++)
	{
		for(j=0; j<8; j++)
		{
			data[i][j] = M[i][j];
		}
	}

	pdata = calloc(4,sizeof(float*));
	for(i=0; i<4; i++)
	{
		pdata[i] = calloc(3,sizeof(float));
	}

	kpca(data, 4, 8, 3, pdata);


	for(i=0; i<4; i++)
	{
		for(j=0; j<3; j++)
		{
			printf("%f ", pdata[i][j]);
		}
		printf("\n");
	}

	return EXIT_SUCCESS;
}*/








