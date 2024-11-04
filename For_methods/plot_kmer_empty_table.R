library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)

df<-read.table("For_methods/converted_kmer_empty_table.csv", sep=",", header=TRUE)

pdf(file="kmer_empty_table.pdf", width=4.5, height=3, onefile=FALSE)

df$k<-as.factor(df$k)

p<-ggplot(df, aes(x=k, y=empty, group=Cutoff)) +
  geom_line(aes(color=Cutoff))+
  geom_point(aes(shape=Cutoff))+
  xlab("Length of k-mer")+
  ylab("Empty ratio")+
  # theme(axis.text.x = element_text(angle=0, hjust=0.4, size = 6))+
  # theme(axis.title.y = element_text(size = 8))+
  ylim(c(0,1))
p




dev.off()