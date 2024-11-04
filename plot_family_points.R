library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)

pdf(file="lachnospiraceae_diff_points.pdf", width=6, height=5, onefile=FALSE)

df<-read.table("lachnospiraceae_diff_points.csv", sep=",", header=TRUE)
df$Pvalue=log(df$Pvalue, 2)


dat <-filter(df, CRC>control)
ratio <- nrow(dat)/nrow(df)


p <- ggplot(df, aes(CRC, control))
p + geom_point(alpha = 8/10, aes(colour = Pvalue), size=0.5)+
  xlim(c(0, 1))+ylim(c(0, 1))+
  geom_abline(colour='lightblue', linetype = 2, size=0.5)



         

dev.off()