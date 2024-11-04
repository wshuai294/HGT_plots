library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)

pdf(file="intra_freq.pdf", width=4, height=3, onefile=FALSE)


df<-read.table("intra_freq.csv", sep=",", header=TRUE)

p <- ggboxplot(df, x = "Level", y = "Frequency", outlier.shape=NA,
                fill = "#56B4E9")+
  ylab("Intra-taxa Proportion")+
  xlab("") + theme(axis.text.x = element_text(angle = 0))+ theme(legend.position="none")

  
# Add a horizontal line at y = 0.5
p + geom_hline(yintercept = 0.5, color = "red", linetype = "dashed")






dev.off()