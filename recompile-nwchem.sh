#!/bin/bash

module purge
module load /share/apps/modulefiles/gcc48 mvapich2-2.2b_intel2013

export MKLROOT=/share/apps/intel/composer_xe_2013_sp1.3.174/mkl
export NWCHEM_TOP=/share/apps/nwchem-6.8/nwchem-6.8-NoPython
export NWCHEM_TARGET=LINUX64
export ARMCI_NETWORK=OPENIB
export CC=icc
export FC=ifort link
export USE_NOFSCHECK=TRUE
export NWCHEM_FSCHECK=N
export LARGE_FILES=TRUE
export MRCC_THEORY=Y
export EACCSD=Y
export IPCCSD=Y
export CCSDTQ=Y
export CCSDTLR=Y
export NWCHEM_LONG_PATHS=Y
export HAS_BLAS=yes
export BLAS_LOC=${MKLROOT}/lib/intel64
export BLASOPT="-lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lm -ldl"
export BLAS_SIZE=4
export MAKE=/usr/bin/make
export LD_LIBRARY_PATH="/share/apps/mpi/mvapich2-2.2b_intel2013/lib:/share/apps/python/lib/:/export/apps/intel/composer_xe_2013_sp1.3.174/compiler/
lib/intel64/"
export USE_MPI=y
export USE_MPIF=y
export USE_MPIF4=y
export MPIEXEC=/share/apps/mpi/mvapich2-2.2b_intel2013/bin/mpiexec
export MPI_LIB=/share/apps/mpi/mvapich2-2.2b_intel2013/lib
export MPI_INCLUDE=/share/apps/mpi/mvapich2-2.2b_intel2013/include
export LDFLAGS="-L/export/apps/compilers/intel2013/composer_xe_2013_sp1.3.174/compiler/lib/intel64/"

#Recompile
export USE_64TO32=y
cd $NWCHEM_TOP/src/nwdft/lr_tddft
make -j4
cd $NWCHEM_TOP/src
make link -j4

