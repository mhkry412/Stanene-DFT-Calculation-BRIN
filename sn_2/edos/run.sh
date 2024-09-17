#!/bin/bash
#electron density of states in Stanene

mpirun -np 6 pw.x < scf.in > scf.out &
mpirun -np 6 pw.x < nscf.in > nscf.out &
mpirun -np 6 dos.x < dos.in > dos.out &
