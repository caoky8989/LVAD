#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=24
#SBATCH --time=24:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=<cu-identikey>@colorado.edu
#SBATCH --partition=shas
#SBATCH --output=job-test-Case-01-%j.out

## Written by : Akshita Sahni, 14th July 2021
## Purpose : To submit a svsolver job on RC resources

## purge all existing modules

module purge

## load the mpi, intel and python modules

export MODULEPATH=/curc/sw/modules/spack/spring2020/linux-rhel7-x86_64/Core:$MODULEPATH
module load gcc/6.1.0
module load openmpi/2.0.1
module load singularity/

## run the solver script
echo "job started"

mpirun -n $SLURM_NTASKS singularity exec --bind /scratch/summit /home/keca4089/svsolver_container/simvascular.sif /opt/svSolver/BuildWithMake/Bin/svsolver-openmpi.exe solver.inp

echo "job ended"
