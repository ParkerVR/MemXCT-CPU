#!/bin/bash

#DOMAIN INFORMATION
export NUMTHE=360
export NUMRHO=256
export PIXSIZE=1
#SOLVER DATA
export NUMITER=24
#TILE SIZE (MUST BE POWER OF TWO)
export SPATSIZE=32
export SPECSIZE=32
#BLOCK SIZE
export PROJBLOCK=128
export BACKBLOCK=128
#BUFFER SIZE
export PROJBUFF=8
export BACKBUFF=8
#I/O FILES
export THEFILE=./ADS1_theta.bin
export SINFILE=./ADS1_sinogram.bin
export OUTFILE=./recon_ADS1.bin

export OMP_NUM_THREADS=1

mpirun -np 32 ./memxct
