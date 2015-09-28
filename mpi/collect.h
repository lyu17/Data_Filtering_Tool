/*
 * collect.h
 *
 *  Created on: Jan 2014
 *      Author: li
 */

#ifndef COLLECT_H_
#define COLLECT_H_

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>

#define NFEATURES 23
#define NSAMPLES 2

void metric_collect(float[],int);
void metric_normalize(float[]);


#endif /* COLLECT_H_ */
