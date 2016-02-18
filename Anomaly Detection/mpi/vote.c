/*
 * vote.c
 *
 *  Created on: Jan 2014
 *      Author: li
 */

#include "ams.h"

int one_phase_vote(int *cluster, int num_pt)
{
	int i, vote_num = 0;
	int center = cluster[0];
	for(i=1; i<num_pt; i++)
	{
		if(center==cluster[i])
		{
			vote_num++;
		}
	}
	if(vote_num>=num_pt/2)
	{
		return 1;
	}
	return 0;
}

int two_phase_vote(int *cluster, int *label)
{
	int i;
	int vote_num = 0;
	int majority = 0;
	int center = cluster[0];
	for(i=1; i<num_pt; i++)
	{
		if(label[i]==1)
		{
			majority ++;
			if(center==cluster[i])
			{
				vote_num++;
			}
		}
	}
	if(vote_num>=majority/2)
	{
		return 1;
	}
	return 0;
}

/*int main(void) {

	int c[4] = { 0,0,0,1 };
	int l[4] = { 1,1,1,0 };

	num_pt = 4;
	printf("%d\n",one_phase_vote(c,num_pt));
	printf("%d\n",two_phase_vote(c,l));

	return 1;
}*/
