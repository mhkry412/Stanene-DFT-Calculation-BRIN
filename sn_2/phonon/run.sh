#! /bin/bash
# Phonon of Stanene
#############################################
mpirun -np 6 pw.x < scf.in > scf.out
mpirun -np 6 ph.x < ph.in > ph.out
mpirun -np 6 q2r.x < q2r.in > q2r.out
mpirun -np 6 matdyn.x < matdyn.in > matdyn.out
