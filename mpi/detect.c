/*
 ============================================================================
 Name        : detect.c
 Author      : Li Yu
 Version     :
 Copyright   : Your copyright notice
 Description : A scalable, non-parametric anomaly detector
 ============================================================================
 */

#include "ams.h"
#include "vote.h"
#include "kpca.h"
#include "grouping.h"
#include "collect.h"
#include "detect.h"


int main(int argc, char* argv[])
{
	if(argc!=3)
	{
		printf("Group [NPROCS] [GROUP_SIZE] \n");
		return 0;
	}
	else
	{
		num_procs = atoi(argv[1]);
		group_size = atoi(argv[2]);
		feature_per_node = NFEATURES*NSAMPLES;
	}

	double t1, t2;
	int i, rank, count = 0;
	float sendbuf[feature_per_node];
	float recvbuf[group_size*feature_per_node];

	int sendbuf1[1];
	int recvbuf1[group_size];

	int localrank[group_size];
	int ranks[num_procs][group_size];

	MPI_Group orig_group, new_group[group_size];
	MPI_Comm new_comm[group_size];
	MPI_Init(&argc,&argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	rand_group(rank,localrank);

	MPI_Allgather(localrank,group_size,MPI_INT,ranks,group_size,MPI_INT,MPI_COMM_WORLD);

	MPI_Comm_group(MPI_COMM_WORLD, &orig_group);

	for(i=0;i<num_procs;i++) {
		MPI_Group_incl(orig_group,group_size,ranks[i],&new_group[i]);
		MPI_Comm_create(MPI_COMM_WORLD,new_group[i],&new_comm[i]);
	}

	while(count<NUM_DETECTION*NSAMPLES)
	{
		lab_one = 0;
		lab_two = 0;
		metric_collect(sendbuf,count%NSAMPLES);
		count ++;
		if(count%NSAMPLES==0)
		{
			t1 = MPI_Wtime();

			metric_normalize(sendbuf);

			for(i=0;i<num_procs;i++)
			{
				if(is_in_group(rank,ranks[i]))
				{
					MPI_Gather(sendbuf,feature_per_node,MPI_FLOAT,recvbuf,feature_per_node,MPI_FLOAT,0,new_comm[i]);
				}
				MPI_Barrier(MPI_COMM_WORLD);
			}

			lab_one = detect_phase_one((float*)recvbuf);

			sendbuf1[0] = lab_one;

			MPI_Barrier(MPI_COMM_WORLD);

			for(i=0;i<num_procs;i++)
			{
				if(is_in_group(rank,ranks[i]))
				{
					MPI_Gather(sendbuf1,1,MPI_INT,recvbuf1,1,MPI_INT,0,new_comm[i]);
				}
				MPI_Barrier(MPI_COMM_WORLD);
			}

			lab_two = detect_phase_two(cluter_index,(int*)recvbuf1);

			t2 = MPI_Wtime();

			if(rank==0)
			{
				printf( "\nThe %dth detection: time cost = %5.4f\n", count/NSAMPLES, t2-t1 );
			}
			MPI_Barrier(MPI_COMM_WORLD);

			for(i=0; i<num_procs; i++)
			{
				if(rank==i)
				{
					printf( "Node [%d] ", rank);
					disp_result(lab_one,lab_two);
				}
				MPI_Barrier(MPI_COMM_WORLD);
			}

		}

		sleep(COLC_INTERVAL);

		MPI_Barrier(MPI_COMM_WORLD);
	}

	MPI_Finalize();

	return 0;
}

int detect_phase_one(float *array)
{
	detect_init(array);

//	disp_data("Original Data",data,group_size,feature_per_node);

	kpca(data,group_size,feature_per_node,PROJECT_DIM,proj_data);

//	disp_data("Projected Data",proj_data,group_size,PROJECT_DIM);

	ams(proj_data,group_size,PROJECT_DIM,cluter_index);

//	disp_vector("Clustering",cluter_index,group_size);

	return one_phase_vote(cluter_index,group_size);
}

int detect_phase_two(int *cluster, int *phase_one_label)
{
	int tmp = two_phase_vote(cluster,phase_one_label);
	detect_release();
	return tmp;
}




