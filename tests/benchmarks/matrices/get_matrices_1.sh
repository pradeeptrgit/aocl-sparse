#!/usr/bin/env bash
# Author: Nico Trost

matrices=(pdb1HYS
          consph
          cant
          pwtk
          rma10
          shipsec1
          mac_econ_fwd500
          mc2depi
          scircuit
)

url=(https://sparse.tamu.edu/MM/Williams
     https://sparse.tamu.edu/MM/Williams
     https://sparse.tamu.edu/MM/Williams
     https://sparse.tamu.edu/MM/Boeing
     https://sparse.tamu.edu/MM/Bova
     https://sparse.tamu.edu/MM/DNVS
     https://sparse.tamu.edu/MM/Williams
     https://sparse.tamu.edu/MM/Williams
     https://sparse.tamu.edu/MM/Hamm
)

for i in {0..8}; do
    m=${matrices[${i}]}
    u=${url[${i}]}
    if [ ! -f ${m}.csr ]; then
        if [ ! -f ${m}.mtx ]; then
            if [ ! -f ${m}.tar.gz ]; then
                echo "Downloading ${m}.tar.gz ..."
                wget ${u}/${m}.tar.gz
            fi
            echo "Extracting ${m}.tar.gz ..."
            tar xf ${m}.tar.gz && mv ${m}/${m}.mtx . && rm -rf ${m}.tar.gz ${m}
        fi
    fi
done
