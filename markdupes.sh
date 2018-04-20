ddm="/Users/danthomas/Documents/naiandinus_gen/BAM/dmBAM/"

cd /Users/danthomas/Documents/naiandinus_gen/BAM/sortedBAM

touch $ddm"markdupe_log.txt"

for i in *
do
    echo $i
    output=${i/.sorted.bam/.MD.bam}
    echo $output
    picard MarkDuplicates \
        I=$i \
        O=$ddm$output \
        M=$output.metrics.txt \
        REMOVE_DUPLICATES=true \
        MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=256 \
    && echo $output finished >> markdupe_log.txt || echo "Something's fucked with "$output >> markdupe_log.txt
done
