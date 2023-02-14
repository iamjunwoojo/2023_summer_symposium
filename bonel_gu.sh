#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'tissue 이름 쳐라 '
    exit 0
fi



mkdir symposium_${1}
cat */megahit_out/final.contigs.fa > ${1}_life4_contig
mv ${1}_life4_contig symposium_${1}

for i in $(ls|grep TCGA)
do
mkdir symposium_${1}/${i}
cp ${i}/*last.fq symposium_${1}/${i}
done
