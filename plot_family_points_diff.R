library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)

pdf(file="lachnospiraceae_diff_points_test.pdf", width=6, height=5, onefile=FALSE)

df<-read.table("lachnospiraceae_diff_points.csv", sep=",", header=TRUE)
df$Pvalue=log(df$Pvalue, 2)

frequency = c()
Group = c()

for (x in df$control){
  frequency<- append(frequency, x)
  Group <- append(Group, "control")
}

for (x in df$CRC){
  frequency<- append(frequency, x)
  Group <- append(Group, "CRC")
}




dat <- data.frame(frequency, Group)



p1 <- ggboxplot(dat, x = "Group", y = "frequency",
                color = "Group", palette = c("slateblue1" , "tomato"), add="mean")+
  ylab("Frequency")+
  stat_compare_means(aes(group = Group), label = "p.format", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("")

p1




dev.off()