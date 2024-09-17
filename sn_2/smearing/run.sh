#!/bin/bash
# Explore the effect of the smearing functions and energies

# Set a variable sf for the smearing functions.
for sf in fd gauss mp mv; do
# Set a variable se for the smearing energies.
for se in 0.005 0.010 0.015 0.020 0.025 0.030 0.035 0.040; do

# Make input file for the scf calculation.
cat > $sf.$se.in << EOF
&control
calculation = 'scf'
prefix='stanene',
pseudo_dir = '../pseudo/',
outdir='../tmp/'
/
&system
ibrav = 4,
a = 4.683527522,
c=20,
nat = 2,
ntyp = 1,
ecutwfc = 60.0,
ecutrho = 480
occupations = 'smearing'
smearing      = '$sf'
degauss       = $se
/
&electrons
mixing_beta = 0.7
conv_thr = 1.0d-6
/
ATOMIC_SPECIES
Sn 118.710 Sn_pbe_v1.uspp.F.UPF
ATOMIC_POSITIONS (crystal)
Sn            0.3333333330        0.6666666660        0.5000000000    
Sn            0.6666666660        0.3333333330        0.4578734224
K_POINTS {automatic}
24 24 1 0 0 0
EOF

# Run pw.x for SCF calculation.
mpirun -np 6 pw.x <$sf.$se.in> $sf.$se.out

# Write the name of the smearing functions, the smearing energies, and total energies.

awk -v var="$sf" '/!/ {printf"%-6s %1.3f %s\n",var,'$se',$5}' $sf.$se.out >> calc-smearing.dat

# End of for sf loop.
done
# End of for se loop.
done
