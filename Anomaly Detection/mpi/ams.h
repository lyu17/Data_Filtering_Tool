/*
 * ams.h
 *
 *  Created on: Jan 2014
 *      Author: li
 */

#ifndef AMS_H_
#define AMS_H_

#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#define MAX_ITER 100

#define STP_DIST 0.1

typedef struct
{
	float *data;
	float *mode;
	float bandwidth;
	float weight;
} point;

point **pts;

// number of dimensions
int data_dim;

// number of points
int num_pt;

// k-th nearest neighbor
int kth;

// the maximum iteration
int max_iter;

float square(float, float);
float calculate_l1_norm(float*, float*);
int is_equal(float*, float*);
void assign(float*, float*);
void get_bandwidth();
void do_one_iteration(float*, float*);
void do_ams();
void prune_modes(int* index);
void initialize_data(float**, int, int);
void release_data();
void print_data();
void ams(float**, int, int, int*);

#endif /* AMS_H_ */
