library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)

pdf(file="micro_len_compar.pdf", width=3, height=2, onefile=FALSE)

df<-read.table("microhomology_length.csv", sep=",", header=TRUE)



p1 <- ggboxplot(df, x = "Group", y = "Microhomology", fill = "Group", palette = c("#56B4E9", "#009E73"), add="mean", outlier.shape = NA)+
  ylab("Microhomology")+
  stat_summary(fun = mean, geom = "point", shape = 21, size = 3, fill = "white", color = "black")+
  xlab("")+ coord_cartesian(ylim = c(0, 10))+
  theme(legend.position = "none")

p1+ annotate("text", x = 1.7, y = 8, label = "p = 3.3e-58", size = 5, color = "black")





dev.off()