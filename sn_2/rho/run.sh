#! /bin/bash
# Charge density of Stanene
###################################

mpirun -np 6 pw.x < scf.in > scf.out
mpirun -np 6 pp.x < pp.in > pp.out