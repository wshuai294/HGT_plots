library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)

df<-read.table("network_comparison_normalized.csv", sep=",", header=TRUE)




# pdf(file="nodes_increase_with_depth.pdf", width=18, height=12, onefile=FALSE)

# df<-filter(df, Cohort!="WirbelJ_2018")

# p1 <- ggboxplot(filter(df, Property=="density"), x = "Level", y = "Value", yscale = "log2",
#                color = "Group", palette = c("slateblue1" , "tomato"), add="mean")+
#                 ylab("Density")+
#                 stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+ 
#                 grids(linetype = "dashed")+
#                 xlab("")

# df$Value <- df$Origin/log(df$Bases)

p <- ggplot(filter(df, Property=="Edge" & Level == "species" ), aes(Bases, Origin))
p + geom_point(alpha = 5/10, aes(colour = Group))+ 
  geom_smooth(method='lm')

# dev.off()