#!/bin/bash
#calculate electron bands in Stanene with SOC

mpirun -np 6 pw.x < scf.in > scf.out &
mpirun -np 6 pw.x < nscf.in > nscf.out &
mpirun -np 6 bands.x < bands.in > bands.out &