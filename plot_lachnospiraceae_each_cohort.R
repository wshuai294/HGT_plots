library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)

df<-read.table("lachnospiraceae_each_cohort_ratio.csv", sep=",", header=TRUE)
# df<-filter(df, cohort!="YuJ_2015"& cohort!="WirbelJ_2018" & cohort!="FengQ_2015")
# df<-filter(df, cohort=="ZellerG_2014" )

pdf(file="lachnospiraceae_each_cohort.pdf", width=12, height=7, onefile=FALSE)


p1 <- ggboxplot(filter(df, cohort=="YachidaS_2019"), x = "Group", y = "Ratio",
                color = "Group", palette = c("slateblue1" , "tomato"), add="mean")+
  ylab("Ratio")+
  stat_compare_means(aes(group = Group), label = "p.format", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("YachidaS_2019")


p2 <- ggboxplot(filter(df, cohort=="FengQ_2015"), x = "Group", y = "Ratio",
                color = "Group", palette = c("slateblue1" , "tomato"), add="mean")+
  ylab("Ratio")+
  stat_compare_means(aes(group = Group), label = "p.format", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("FengQ_2015")

p3 <- ggboxplot(filter(df, cohort=="VogtmannE_2016"), x = "Group", y = "Ratio",
                color = "Group", palette = c("slateblue1" , "tomato"), add="mean")+
  ylab("Ratio")+
  stat_compare_means(aes(group = Group), label = "p.format", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("VogtmannE_2016")

p4 <- ggboxplot(filter(df, cohort=="ThomasAM_2018a"), x = "Group", y = "Ratio",
                color = "Group", palette = c("slateblue1" , "tomato"), add="mean")+
  ylab("Ratio")+
  stat_compare_means(aes(group = Group), label = "p.format", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("ThomasAM_2018a")


p5 <- ggboxplot(filter(df, cohort=="ThomasAM_2018b"), x = "Group", y = "Ratio",
                color = "Group", palette = c("slateblue1" , "tomato"), add="mean")+
  ylab("Ratio")+
  stat_compare_means(aes(group = Group), label = "p.format", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("ThomasAM_2018b")


p6 <- ggboxplot(filter(df, cohort=="WirbelJ_2018"), x = "Group", y = "Ratio",
                color = "Group", palette = c("slateblue1" , "tomato"), add="mean")+
  ylab("Ratio")+
  stat_compare_means(aes(group = Group), label = "p.format", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("WirbelJ_2018")


p7 <- ggboxplot(filter(df, cohort=="ZellerG_2014"), x = "Group", y = "Ratio",
                color = "Group", palette = c("slateblue1" , "tomato"), add="mean")+
  ylab("Ratio")+
  stat_compare_means(aes(group = Group), label = "p.format", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("ZellerG_2014")


p8 <- ggboxplot(filter(df, cohort=="YuJ_2015"), x = "Group", y = "Ratio",
                color = "Group", palette = c("slateblue1" , "tomato"), add="mean")+
  ylab("Ratio")+
  stat_compare_means(aes(group = Group), label = "p.format", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("YuJ_2015")


prow <- plot_grid(
  p1 + theme(legend.position="none"),
  p2 + theme(legend.position="none"),
  p3 + theme(legend.position="none"),
  p4 + theme(legend.position="none"),
  p5 + theme(legend.position="none"),
  p6 + theme(legend.position="none"),
  p7 + theme(legend.position="none"),
  p8 + theme(legend.position="none"),
  align = 'vh',
  hjust = -1,
  nrow = 2
)

legend <- get_legend(
  p1 +
    guides(color = guide_legend(nrow = 1)) +
    theme(legend.position = "bottom")
)
plot_grid(prow, legend, ncol = 1, rel_heights = c(1, .1))

dev.off()



# dat<-filter(df, Group=="CRC")
# crc_mean <- dat$Ratio
# mean(crc_mean)
# 
# dat<-filter(df, Group=="control")
# control_mean <- dat$Ratio
# mean(control_mean)
# 
# wilcox.test(crc_mean, control_mean)
