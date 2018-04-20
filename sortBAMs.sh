
cd /Users/danthomas/Documents/naiandinus_gen/BAM

touch sortBAMs_log.txt 

for i in *
do
    ls $i
    output="sortedBAM/"${i/.bam/.sorted.bam}
    picard SortSam I=$i O=$output SORT_ORDER=coordinate \
    && echo $output finished >> markdupe_log.txt || echo "Something's fucked with "$output >> markdupe_log.txt
done

