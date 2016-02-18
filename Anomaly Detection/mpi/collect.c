/*
 * collect.c
 *
 *  Created on: Jan 2014
 *      Author: li
 */

#include "collect.h"

void metric_collect(float metrics[], int r)
{
	int i;
	FILE *vm_file, *is_file, *sa_file;
	char* token;
	char line[1024];
	vm_file = popen("vmstat | grep [0-9]", "r");
	fgets(line, sizeof(line), vm_file);
	token = strtok(line, " ");
	for(i=0; i<16; i++)
	{
		if(i>1)
		{
			metrics[NFEATURES*r+i-2] = atof(token);
		}
		token = strtok(NULL," ");
	}
	is_file = popen("iostat -m | grep sda | head -n 1", "r");
	fgets(line, sizeof(line), is_file);
	token = strtok(line, " ");
	for(i=0; i<6; i++)
	{
		if(i>0)
		{
			metrics[NFEATURES*r+13+i] = atof(token);
		}
		token = strtok(NULL," ");
	}
	sa_file = popen("sar -n TCP 2 2 | grep Average", "r");
	fgets(line, sizeof(line), sa_file);
	token = strtok(line, " ");
	for(i=0; i<5; i++)
	{
		if(i>0)
		{
			metrics[NFEATURES*r+18+i] = atof(token);
		}
		token = strtok(NULL," ");
	}
	pclose(vm_file);
	pclose(is_file);
	pclose(sa_file);
}

void metric_normalize(float metrics[])
{
	int i;
	float norm[] = {5000,780000,8000000,8000000,100000,100000,100000,100000,5000,5000,100,100,100,100,1,1,1,100000,100000,500,500,500,500};
	for(i=0; i<NFEATURES; i++)
	{
		metrics[i] = metrics[i]/norm[i];
		metrics[i+NFEATURES] = metrics[i+NFEATURES]/norm[i];
	}
}






