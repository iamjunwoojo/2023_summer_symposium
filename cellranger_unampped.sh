samtools view --threads 10 -bh -f 4 possorted_genome_bam.bam > unmapped.bam
samtools fastq --threads 11 unmapped.bam -T CB,UB > unmapped.fastq
