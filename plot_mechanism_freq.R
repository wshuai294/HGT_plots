library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)

df<-read.table("mechanism_freq.csv", sep=",", header=TRUE)
df

pdf(file="mechanism_freq.pdf", width=8, height=3, onefile=FALSE)

my_colors<-c("#56B4E9", "#009E73","#E69F00")
# Stacked + percent
ggplot(df, aes(fill=mechanism, y=frequency, x=sample)) + 
  geom_bar(position="fill", stat="identity")+theme_bw()+theme_classic()+
  xlab("Sample")+
  theme(axis.text.x = element_blank(),legend.position = "bottom", axis.line.y = element_blank())+
  scale_fill_manual(values=my_colors)


dev.off()