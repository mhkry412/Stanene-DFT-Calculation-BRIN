#!/bin/bash
# Convergence test of k-points grid.
# Set a variable k-point from 3 to 24.
for k in 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24; do
# Make input file for the SCF calculation.
# k-points grid is assigned by variable n.
cat > kpoint.$k.in << EOF
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
ecutwfc = 60,
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
${k} ${k} 1 0 0 0
EOF
# Run pw.x for SCF calculation.
mpirun -np 6 pw.x <kpoint.$k.in>kpoint.$k.out
# Write the number of k-points (= k*k*1) and
# the total energy in calc-kpoint.dat
awk '/!/ {printf"%d %s\n",'$k',$5}' kpoint.$k.out >> calc-kpoint.dat
# End of for loop.
done