library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)

df<-read.table("classifier_feature_num.csv", sep=",", header=TRUE)
df

pdf(file="auc_increase.pdf", width=5, height=4, onefile=FALSE)


p<-ggplot(df, aes(x=Feature_number, y=AUC, group=Task)) +
  geom_line(aes(color=Task))+
  geom_point(aes(shape=Task))+
  #scale_x_continuous(breaks = df$Feature_number, labels = df$Feature_number) +
  xlab("No. of biomarkers")+
  ylab("Average AUC")+
  theme(axis.text.x = element_text(angle=30, hjust=0.4, size = 10))+
  theme(axis.title.y = element_text(size = 10))+theme_bw()+theme_classic()+
  geom_hline(yintercept = 0.5, linetype = "dashed")

p + theme(legend.position="top", axis.text.x = element_text(angle=0, hjust=0.4, size = 6))+
  guides(color=guide_legend(nrow=2, byrow=TRUE))


#print(p)
mean(df[df$Feature_number==5,]$AUC)
mean(df[df$Feature_number==60,]$AUC)

dev.off()
