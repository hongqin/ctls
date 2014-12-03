setwd("~/github/ctls/sequences")
install.packages("seqinr")
library(seqinr);
list.files()

seqs = read.fasta("panda16srDNA.fasta")
str(seqs);

seqs[[1]]
length(seqs[[1]])
c2s( rev( comp(seqs[[1]]) ) )

c2s(seqs[[1]][1:120])
c2s(comp(seqs[[1]][1:120]))



