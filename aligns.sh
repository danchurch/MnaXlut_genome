############################
#!/usr/bin/env bash

## path to our fastqs
fpath='/Users/danthomas/Documents/naiandinus_gen/for_dan/Cooley_3315_160429B1/'

touch error_log_13.04.2018.txt

cd /Users/danthomas/Documents/naiandinus_gen/Luteus_genome

for i in $fpath*001.fastq; do
	j=$(basename $i)
	k=${j/fastq/sam}
	echo $i >> error_log_13.04.2018.txt
	bowtie2 --local  -x Mlu -U $i -S /Users/danthomas/Documents/naiandinus_gen/SAM/$k \
	&& echo $k done >> error_log_13.04.2018.txt || echo $k fucked up somehow >> error_log_13.04.2018.txt
done

############################
