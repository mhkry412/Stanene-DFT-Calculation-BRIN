#!/bin/bash
# Convergence test of cut-off energy.
# Set a variable ecut from 20 to 80 Ry.
for ecut in 20 30 40 50 60 70 80 90 100; do
# Make input file for the SCF calculation.
# ecutwfc is assigned by variable ecut.
cat > ecut.$ecut.in << EOF
&control
calculation = 'scf'
prefix='stanene',
pseudo_dir = '../pseudo/',
outdir='../tmp/'
/
&system
ibrav = 4,
a=4.68,
c=20,
nat = 2,
ntyp = 1,
ecutwfc = ${ecut},
/
&ELECTRONS
conv_thr     = 1.0D-6
/
ATOMIC_SPECIES
Sn 118.710 Sn_pbe_v1.uspp.F.UPF
ATOMIC_POSITIONS (crystal)
Sn 0.333333333 0.666666666 0.500000000
Sn 0.666666666 0.333333333 0.500000000
K_POINTS {automatic}
24 24 1 0 0 0
EOF
# Run SCF calculation.
mpirun -np 6 pw.x <ecut.$ecut.in> ecut.$ecut.out
# Write cut-off and total energies in calc-ecut.dat.
awk '/!/ {printf"%d %s\n",'$ecut',$5}' ecut.$ecut.out >> calc-ecut.dat
# End of for loop
done
