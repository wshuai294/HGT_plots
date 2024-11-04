library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)

df<-read.table("genome_density_distribution.csv", sep=",", header=TRUE)
pdf(file="genome_density_distribution.pdf", width=5, height=4, onefile=FALSE)
# df$proportion<-log(df$proportion)
ggplot(filter(df, proportion < 0.005), aes(x=proportion)) +
  geom_histogram(position="identity", alpha=0.5, bins = 100, colour='black', fill="tomato")+
  xlab("Proportion of break positions")+ theme(legend.position="none")

dev.off()