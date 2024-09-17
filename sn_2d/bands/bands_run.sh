#! /bin/bash
# Band structure of stanene with SOC
############################

mpirun -np 6 pw.x < pw.scf.bands.sn.in > pw.scf.bands.sn.out
mpirun -np 6 pw.x < pw.bands.sn.in  > pw.bands.sn.out
mpirun -np 6 bands.x < pp.bands.sn.in > pp.bands.sn.out