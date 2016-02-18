/*
 * detect.h
 *
 *  Created on: Jan 2014
 *      Author: li
 */

#ifndef DETECT_H_
#define DETECT_H_

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <time.h>
#include "mpi.h"

#define NUM_DETECTION 10
#define COLC_INTERVAL 10
#define PROJECT_DIM 3

int feature_per_node;
int group_size;
int num_procs;

int lab_one;
int lab_two;

float **data;
float **proj_data;
int *cluter_index;
int *one_phase_label;

inline void detect_init(float *array)
{
	int i, j;
	data = calloc(group_size,sizeof(float*));
	for(i=0; i<group_size; i++)
	{
		data[i] = calloc(feature_per_node,sizeof(float));
	}
	for(i=0; i<group_size; i++)
	{
		for(j=0; j<feature_per_node; j++)
		{
			data[i][j] = array[feature_per_node*i+j];
		}
	}
	proj_data = calloc(group_size,sizeof(float*));
	for(i=0; i<group_size; i++)
	{
		proj_data[i] = calloc(PROJECT_DIM,sizeof(float));
	}
	cluter_index = calloc(group_size,sizeof(int));
	one_phase_label = calloc(group_size,sizeof(int));
}

inline void detect_release()
{
	int i;
	for(i=0; i<group_size; i++)
	{
		free(data[i]);
		free(proj_data[i]);
	}
	free(data);
	free(proj_data);
	free(cluter_index);
	free(one_phase_label);
}

void disp_data(char* desc, float **data, int m, int n)
{
	int i, j;
	printf("%s\n\n",desc);
	for(i=0; i<m; i++)
	{
		for(j=0; j<n; j++)
		{
			printf("%f ", data[i][j]);
		}
		printf("\n");
	}
	printf("\n");
}

void disp_vector(char* desc, int *vect, int m)
{
	int i;
	printf("%s\n\n",desc);
	for(i=0; i<m; i++)
	{
		printf("%d ", vect[i]);
	}
	printf("\n\n");
}

void disp_result(int one, int two)
{
	if(one==1)
	{
		printf("Phase one: M (Majority)    ");
	}
	else
	{
		printf("Phase one: F (Fewness)     ");
	}

	if(two==1)
	{
		printf("Phase two: N (Normal)\n");
	}
	else
	{
		printf("Phase two: A (Abnormal)\n");
	}
}

int detect_phase_one(float*);
int detect_phase_two(int*, int*);

#endif /* DETECT_H_ */
