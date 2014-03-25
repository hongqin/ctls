#heatplus map by average and by AA and CA

 rm=( list=ls() );

 source("http://bioconductor.org/biocLite.R"); 
 biocLite("Heatplus");
 help(package="Heatplus");

 library(Heatplus); #load the package

 #read the data
 #make sure your R is working in the right directory
 #You will have to change to the appropirate directory if necessary
 data=read.csv("yates.miRNA.csv",row.names=1);

 #transpose the matrix
 #switch rows and columns
 data = t(data);
 
 ### do heatmap_2
 #pdf("_hsa-mi-cand.heat.average.093008.pdf",width=9,height=6);

 mymethod = "average";#this is UPGMA
 # mymethod = "ward";

 #all data
 heatmap_2(data, do.dendro = c(TRUE, TRUE), legend = 1, 
  legfrac = 10,
  hclustfun = function(c) hclust( c, method= mymethod),
  col = RGBColVec(64) )

 #heatmap by AA
 # take a subset of data for African Americans
 dataAA = data[grep("AA", rownames(data)), ]
 heatmap_2(dataAA, do.dendro = c(TRUE, TRUE), legend = 1, 
  legfrac = 10,
  hclustfun = function(c) hclust( c, method= mymethod),
  col = RGBColVec(64),
  #main = "AA experiments"
 )

 #heatmap by CA
 dataAA = data[grep("CA", rownames(data)), ]
 heatmap_2(dataAA, do.dendro = c(TRUE, TRUE), legend = 1, 
  legfrac = 10,
  hclustfun = function(c) hclust( c, method= mymethod),
  col = RGBColVec(64),
  #main = "CA experiments"
 )

 #dev.off();

quit("yes");

############
############ END
############

