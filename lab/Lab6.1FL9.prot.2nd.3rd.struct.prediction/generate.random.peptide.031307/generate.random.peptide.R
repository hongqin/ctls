#031107Tue Hong Qin Generate random peptide for student's assignment

rm(list=ls());

len = 40;  ## 40 amino acid
iterations = 30;

tb = read.csv("chou.fasman.table.txt",header=T);  ##read in Chou Fasman table

aa.H = as.character( tb$letter[tb$favor=="H"] )
aa.E = as.character( tb$letter[tb$favor=="E"] )
aa.C = c( as.character( tb$letter[tb$favor=="T"] ), "R");

pos = seq(1:len);


#generate coil-helix-coil
h.start = 5;
h.end  = 35;
h.len = (h.end - h.start) + 1;

out.helix = vector(iterations, mode="character");

for( i in 1:iterations ) {
 seq.tmp = vector(len, mode="character");

 seq.tmp[1:(h.start-1)] = aa.C[round( runif( (h.start-1)) * (length(aa.C)-1) + 1 ) ]

 seq.tmp[ h.start: h.end ] = aa.H[round( runif( h.len) *  (length(aa.H)-1) + 1 ) ]

 seq.tmp[(h.end+1):len] = aa.C[round( runif( (len-h.end)) * (length(aa.C)-1) + 1 ) ]

 seq = paste(seq.tmp, sep="", collapse="")

 out.helix[i] = seq;
}

write.table( out.helix, "coil.helix.coil.40aa.txt", quote=F, col.name=F);


###############3
#generate coil-sheet-coil
h.start = 5;
h.end  = 35;
h.len = (h.end - h.start) + 1;

out.sheet = vector(iterations, mode="character");

for( i in 1:iterations ) {
 seq.tmp = vector(len, mode="character");

 seq.tmp[1:(h.start-1)] = aa.C[round( runif( (h.start-1)) * (length(aa.C)-1) + 1 ) ]

 seq.tmp[ h.start: h.end ] = aa.E[round( runif( h.len) *  (length(aa.E)-1) + 1 ) ]

 seq.tmp[(h.end+1):len] = aa.C[round( runif( (len-h.end)) * (length(aa.C)-1) + 1 ) ]

 seq = paste(seq.tmp, sep="", collapse="")

 out.sheet[i] = seq;
}

write.table( out.sheet, "coil.sheet.coil.40aa.txt", quote=F, col.name=F);




