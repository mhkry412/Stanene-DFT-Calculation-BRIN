#! /bin/bash
# Band structure of stanene with SOC
############################

mpirun -np 6 pw.x < pw.scf.bands.soc.sn.in > pw.scf.bands.soc.sn.out
mpirun -np 6 pw.x < pw.bands.soc.sn.in > pw.bands.soc.sn.out
mpirun -np 6 bands.x < pp.bands.soc.sn.in > pp.bands.soc.sn.out
