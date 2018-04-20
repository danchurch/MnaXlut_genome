########################################

cd /Users/danthomas/Documents/naiandinus_gen/BAM/dmBAM

rgBAMs="/Users/danthomas/Documents/naiandinus_gen/BAM/rgBAM/"

touch $rgBAMs"rglog.txt"

for i in *; do
    echo $i >> $rgBAMs"rglog.txt"
    SM=$(echo $i | sed "s/.*_S/S/g" | sed "s/_L.*//g")
    output=$rgBAMs${i/.MD.bam/.RG.bam}
    picard AddOrReplaceReadGroups  I=$i  O=$output  RGPL=illumina  RGPU=indexSEQ  RGID=27  RGLB=A_Library  RGSM=$SM
    echo $output >> $rgBAMs"rglog.txt"
done

#################################################
