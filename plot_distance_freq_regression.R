library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)

pdf(file="distance_freq_regression.pdf", width=4, height=3, onefile=FALSE)

df<-read.table("distance_frequency.csv", sep=",", header=TRUE)





p <- ggplot(df, aes(distance, frequency))
p + geom_point(alpha = 8/10, aes(colour = "black"), size=0.5)+
 ylim(c(0, 0.003))+
  geom_smooth(method = "lm", se = FALSE, color = "red")



dev.off()