/*
 ============================================================================
 Name        : ams.c
 Author      : Li Yu
 Version     :
 Copyright   : Your copyright notice
 Description : Adaptive Mean-Shift Clustering
 ============================================================================
 */

#include "ams.h"

float square(float a, float b) {return a*b;}

float calculate_l1_norm(float *pt_a, float *pt_b)
{
   int i;
   float dist = 0;
   for(i=0; i<data_dim; i++)
   {
	   dist += fabs(pt_a[i]-pt_b[i]);
   }
   return dist;
}

int is_equal(float *pt_a, float *pt_b)
{
	int i;
	for(i=0; i<data_dim; i++)
	{
		if(pt_a[i]!=pt_b[i])
		{
			return 0;
		}
	}
	return 1;
}

void assign(float *pt_a, float *pt_b)
{
	int i;
	for(i=0; i<data_dim; i++)
	{
		pt_a[i] = pt_b[i];
	}
}


void get_bandwidth()
{
	int i, j, k;
	for(i=0; i<num_pt; i++)
	{
		float *bw_sorted;
		if(NULL==(bw_sorted=calloc(num_pt,sizeof(float))))
		{
			printf("malloc failed\n");
			return;
		}
		for(j=0; j<num_pt; j++)
		{
			float dist = calculate_l1_norm(pts[i]->data,pts[j]->data);
			for(k=0; k<j; k++)
			{
				if(dist<bw_sorted[k])
				{
					float t = bw_sorted[k];
					bw_sorted[k] = dist;
					dist = t;
				}
			}
			bw_sorted[j] = dist;
		}
		pts[i]->bandwidth = bw_sorted[kth-1];
		pts[i]->weight = square(1.0/pts[i]->bandwidth,data_dim*1.0);
		free(bw_sorted);
	}
}

void do_one_iteration(float *old_center, float *new_center)
{
	int i, j;
	float total_weight = 0;
	float *rp;
	if(NULL==(rp=calloc(data_dim,sizeof(float))))
	{
		printf("malloc failed\n");
		return;
	}
	for(i=0; i<num_pt; i++)
	{
		float dist = calculate_l1_norm(old_center,pts[i]->data);
		if(dist<=pts[i]->bandwidth)
		{
			float weight = pts[i]->weight*square((1.0-(dist/pts[i]->bandwidth)),2);
			total_weight += weight;
			for(j=0; j<data_dim; j++)
			{
				rp[j] += *(pts[i]->data) * weight;
			}
		}
	}
	for(i=0; i<data_dim; i++)
	{
		if(total_weight!=0)
		{
			new_center[i] = (unsigned short)(rp[i]/total_weight);
		}
	}
	free(rp);
}

void do_ams()
{
	int i, j;
	float *old_center;
	if(NULL==(old_center=calloc(data_dim,sizeof(float))))
	{
		printf("malloc failed\n");
		return;
	}
	for(i=0; i<num_pt; i++)
	{
		assign(old_center,pts[i]->data);
		for(j=0; j<max_iter; j++)
		{
			do_one_iteration(old_center,pts[i]->mode);
			if(calculate_l1_norm(old_center,pts[i]->mode)<STP_DIST)
			{
				return;
			}
			assign(old_center,pts[i]->mode);
		}
	}
	free(old_center);
}

void prune_modes(int *index)
{
	int i, j;
	int cluster_num = 0;
	index[0] = cluster_num;
	for(i=1; i<num_pt; i++)
	{
		index[i] = -1;
		for(j=0; j<i; j++)
		{
			if(calculate_l1_norm(pts[i]->mode,pts[j]->mode)<STP_DIST)
			{
				index[i] = index[j];
				break;
			}
		}
		if(index[i]==-1)
		{
			index[i] = ++ cluster_num;
		}
	}
}

void initialize_data(float **data, int num, int dim)
{
	data_dim = dim;
	num_pt = num;
	kth = num_pt / 2;
	int i, j;
	if(NULL==(pts=calloc(num_pt,sizeof(*pts))))
	{
		printf("malloc failed\n");
		return;
	}
/*	for(i=0,j=0; i<num_pt; i++,j+=data_dim)
	{
		if(NULL==(pts[i]=calloc(1,sizeof(point))))
		{
			printf("malloc failed\n");
			return;
		}
		pts[i]->data = data + j;
		pts[i]->mode = data + j;
	}*/
	for(i=0,j=0; i<num_pt; i++,j+=data_dim)
	{
		if(NULL==(pts[i]=calloc(1,sizeof(point))))
		{
			printf("malloc failed\n");
			return;
		}
		pts[i]->data = &data[i][0];
		pts[i]->mode = &data[i][0];
	}
}

void release_data()
{
	int i;
	for(i=0; i<num_pt; i++)
	{
		free(pts[i]);
	}
	free(pts);
}

void print_data()
{
	int i, j;
	for(i=0; i<num_pt; i++)
	{
		printf("data[%d]:   ",i);
		for(j=0; j<data_dim; j++)
		{
			printf("%f ", *(pts[i]->data+j));
		}
		printf("\nmode:      ");
		for(j=0; j<data_dim; j++)
		{
			printf("%f ", *(pts[i]->mode+j));
		}
		printf("\nbandwidth: %f\n",pts[i]->bandwidth);
		printf("weight:    %f\n\n",pts[i]->weight);
	}
}

void ams(float **input, int num, int dim, int *index)
{
	initialize_data(input,num,dim);
	get_bandwidth();
	do_ams();
//	print_data();
	prune_modes(index);
	release_data();
}

/*int main(void) {
	int i;
	float M[4][3] = { { 1.5, 2.5, 3.5 },
			          { 1.5, 2.6, 3.5 },
					  { 1.6, 2.5, 3.5 },
					  { 2.5, 3.5, 1.5 } };
	int *index;

	if(NULL==(index=calloc(num_pt,sizeof(int))))
	{
		printf("malloc failed\n");
		return 0;
	}

	ams((float*)M,4,3,index);

	printf("Clustering Results: \n");
	for(i=0; i<num_pt; i++)
	{
		printf("%d\n",index[i]);
	}

	free(index);

	return EXIT_SUCCESS;
}*/
