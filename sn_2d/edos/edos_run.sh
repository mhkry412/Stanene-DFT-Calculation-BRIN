#! /bin/bash
# Density of states (DOS) of stanene
#####################################

mpirun -np 6 pw.x < pw.scf.edos.sn.in >  pw.scf.edos.sn.out
mpirun -np 6 pw.x < pw.nscf.edos.sn.in > pw.nscf.edos.sn.out
mpirun -np 6 dos.x < pp.edos.sn.in > pp.edos.sn.out