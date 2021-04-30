# Generalized Mulliken-Hush Analysis of Electron Transfer Calculation in NWChem

Computing electron transfer matrix element or electron transfer integral (H<sub>ab</sub>) using a Generalized Mulliken−Hush (GMH) in NWChem program.

Herein, tddft module has been being modified to compute electron transfer matrix element using GMH method based on following formula.

```
                (Ej - Ei) * muij
GMH = ------------------------------------
         _______________________________
       \/ (muii - mujj)**2 + 4*(muij**2)
```

where E<sub>i</sub> and E<sub>j</sub> are energy for each pair of ground state and excited state, and mu<sub>ii</sub>, mu<sub>jj</sub>, and mu<sub>ij</sub> are transition dipole moments for different species of the system.

### Useful link
 - [Doxygen for NWChem documenting](http://www.doxygen.nl/)
 - [Generalization of the Mulliken-Hush treatment for the calculation of electron transfer matrix elements Author links open overlay panel by Robert J.Cave et al.](https://www.sciencedirect.com/science/article/abs/pii/0009261495013105)
 - [Computational Methods For Electronic Couplings by Chao-Ping Hsu, Academia Sinica](http://www.q-chem.com/tutorial/Cherri_Hsu_Electronic_Coupling.pdf)

### Disclaimers

This GMH approach is experimentally modified based on original source codes of Time-Dependent Density Functional Theory (all tddft_\*.F files) of NWChem software which were written by Prof. So Hirata. I am not responsible for any damage caused through use of all products here.

The latest version of writing this document is NWChem 6.8.1, which is released as open-source under the ECL 2.0 license.

# Recompile NWChem without full compilation

First, I strongly suggest you to compile NWChem with full packages. Then you can recompile NWChem with my modified GMH source code. Please following the steps below for a successful recompilation of your NWChem integrated with my modified GMH module.

Step 1. Replace TD-DFT source code with a modified GMH source code (you should backup all original source codes as well.)

```
$NWCHEM_TOP/src/etrans
```

where $NWCHEM is set to NWChem top directory.

Step 2. Go to folder where source code is modified.

```
cd $NWCHEM_TOP/src/etrans
```

Step 3. Setting up environmental variable as if first time you compile NWChem. The following is a portion of NWChem compile bash script.

```
export USE_64TO32=y
cd $NWCHEM_TOP/src/etrans
make
cd $NWCHEM_TOP/src
make link
echo "Done"
```

Example bash script can be obtained: [recompile-nwchem.sh](recompile-nwchem.sh).

Step 4. A new NWChem executable *nwchem* will replace the old one.


