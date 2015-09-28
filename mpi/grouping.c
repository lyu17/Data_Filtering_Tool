/*
 * grouping.c
 *
 *  Created on: Jan 2014
 *      Author: li
 */

#include "grouping.h"

int is_in_group(int id, int group[])
{
	int i, flag = 0;
	for(i=0;i<group_size;i++) {
		if(id==group[i]) {
			flag = 1;
			break;
		}
	}
	return flag;
}

void rand_group(int first, int group[])
{
	int i, index, count[num_procs];
	unsigned int seed;
	seed = time(0)*first;
	srand(seed);
	for(i=0;i<num_procs;i++) {
		count[i] = i;
	}
	group[0] = first;
	count[first] = count[num_procs-1];
	for(i=1;i<group_size;i++) {
		index = (int)( (num_procs - i) * 1.0 * rand()/(RAND_MAX + 1.0) );
		group[i] = count[index];
		count[index] = count[num_procs - i - 1];
	}
}
