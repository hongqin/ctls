# pairwise t.test

 rm=( list=ls() );

 data=read.csv("yates.miRNA.csv",row.names=1);

 samples = colnames( data ); #show samples in data
 samples;

 # for this lab, let's take patient RC77
 samples [grep( "RC.77",samples) ]
 sub77 = data[, grep( "RC.77",samples) ];

 #reorder the columns for clean view of the tissues
 sample77names = colnames( sub77 );
 sub77 = sub77[, c(grep("Normal",sample77names), grep("Tumor", sample77names) )]

 # t.test on probes
 sub77 = data.frame(sub77); #make sure it is a data.frame

 # do t.test for every probe (row)
 for( i in 1:length(sub77[,1]) ) { 
    wt = sub77[i, 1:3]; #wildtype is the 3 columns
    tumor = sub77[i, 4:6]; #tunor is the last 3 columns
    tt = t.test( wt, tumor); 
    sub77$p[i] = tt$p.value;
 }

 ### probes with differetial expressions
 out005 = sub77[sub77$p<0.05, ] # 0.05 cutoff
 out001 = sub77[sub77$p<0.01, ] # 0.01 cutoff

 #output your report
 write.csv(out005, "005.csv");
 write.csv(out001, "001.csv"); 

quit("yes");

################################################# 
###              END                          ###
################################################# 
