#! /bin/bash
# Phonon of Graphene
#############################################
mpirun -np 6 pw.x < pw.scf.phonon.sn.in > pw.scf.phonon.sn.out
mpirun -np 6 ph.x < sn.ph.in > sn.ph.out
mpirun -np 6 q2r.x < sn_q2r.in > sn_q2r.out
mpirun -np 6 matdyn.x < sn_matdyn.in > sn_matdyn.out