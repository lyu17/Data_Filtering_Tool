/*
 * kpca.h
 *
 *  Created on: Jan 2014
 *      Author: li
 */

#ifndef KPCA_H_
#define KPCA_H_

#include <math.h>
#include <stdio.h>
#include <stdlib.h>

int rows;
int cols;

#define EPS 0.01
#define GAUSS_PARA 10

float **K, **KL, **c, **v;
float *A, *B;

void exchange(float*, int, int);
void selectionsort(float*, float**);
float product(float*, float*, int);
float kernel(float, float*, float*, int);
void get_kernel_mat(float**, float, int, float**);
void modify_kernel_mat(float**, float**);
int jacobi(float**, float**, float, int);
void orthogonalize(float**);
int selectcharactor(float*, float, float*);
void get_project(int, float**, float**, float**);
void initialize_kpca(int, int);
void release_kpca();
void kpca(float**, int, int, int, float**);

#endif /* KPCA_H_ */
