/*
 * grouping.h
 *
 *  Created on: Jan 2014
 *      Author: li
 */

#ifndef GROUPING_H_
#define GROUPING_H_


#include <stdlib.h>
#include <time.h>

int group_size;
int num_procs;

int is_in_group(int, int[]);
void rand_group(int, int[]);

#endif /* GROUPING_H_ */
