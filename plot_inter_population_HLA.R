df <- read.table('D:/R_script_files/distance_comparison_inter_intra.csv', sep=",", header=TRUE)
head (df)
 
### comparison of inter-population HLA distance with t-test
df1<-df[df$Group=="Intra-superpopulation",]
df2<-df[df$Group=="Inter-superpopulation",]

t.test(df1$Distance, df2$Distance, paired=FALSE, alternative="two.sided")
