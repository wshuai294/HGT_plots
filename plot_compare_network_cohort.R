library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)

dat<-read.table("network_comparison_normalized.csv", sep=",", header=TRUE)

# df<-filter(df, Cohort !="WirbelJ_2018")

# df<-filter(df, Cohort !="WirbelJ_2018" & Cohort !="FengQ_2015" & Cohort !="YuJ_2015" & Bases > 5000000000)




pdf(file="network_comparison_cohort.pdf", width=22, height=12, onefile=FALSE)

df<-filter(dat, Cohort=="ZellerG_2014")
p1 <- ggboxplot(filter(df, Property=="density"), x = "Level", y = "Value", #yscale = "log2",
               color = "Group", palette = c("slateblue1" , "tomato"))+
                ylab("Density")+
                stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
                grids(linetype = "dashed")+
                xlab("ZellerG_2014")

p2<-ggboxplot(filter(df, Property=="transitivity"), x = "Level", y = "Value", 
              color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Transitivity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("ZellerG_2014")


p3<-ggboxplot(filter(df, Property=="assortativity"), x = "Level", y = "Value",
              color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Assortativity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("ZellerG_2014")

p4<-ggboxplot(filter(df, Property=="algebraic_connectivity"), x = "Level", y = "Value",
              color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Algebraic connectivity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("ZellerG_2014")


df<-filter(dat, Cohort=="WirbelJ_2018")
p5 <- ggboxplot(filter(df, Property=="density"), x = "Level", y = "Value", #yscale = "log2",
                color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Density")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("WirbelJ_2018")

p6<-ggboxplot(filter(df, Property=="transitivity"), x = "Level", y = "Value", 
              color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Transitivity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("WirbelJ_2018")


p7<-ggboxplot(filter(df, Property=="assortativity"), x = "Level", y = "Value",
              color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Assortativity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("WirbelJ_2018")

p8<-ggboxplot(filter(df, Property=="algebraic_connectivity"), x = "Level", y = "Value",
              color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Algebraic connectivity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("WirbelJ_2018")

df<-filter(dat, Cohort=="VogtmannE_2016")
p9 <- ggboxplot(filter(df, Property=="density"), x = "Level", y = "Value", #yscale = "log2",
                color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Density")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("VogtmannE_2016")

p10<-ggboxplot(filter(df, Property=="transitivity"), x = "Level", y = "Value", 
              color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Transitivity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("VogtmannE_2016")


p11<-ggboxplot(filter(df, Property=="assortativity"), x = "Level", y = "Value",
              color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("assortativity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("VogtmannE_2016")

p12<-ggboxplot(filter(df, Property=="algebraic_connectivity"), x = "Level", y = "Value",
              color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Algebraic connectivity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("VogtmannE_2016")

# for all the data
p13 <- ggboxplot(filter(dat, Property=="density"), x = "Level", y = "Value", #yscale = "log2",
                color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Density")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("All")

p14<-ggboxplot(filter(dat, Property=="transitivity"), x = "Level", y = "Value", 
               color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Transitivity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("All")


p15<-ggboxplot(filter(dat, Property=="assortativity"), x = "Level", y = "Value",
               color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Assortativity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("All")

p16<-ggboxplot(filter(dat, Property=="algebraic_connectivity"), x = "Level", y = "Value",
               color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Algebraic connectivity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("All")


df<-filter(dat, Cohort=="FengQ_2015")
p17 <- ggboxplot(filter(df, Property=="density"), x = "Level", y = "Value", #yscale = "log2",
                 color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Density")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("FengQ_2015")

p18<-ggboxplot(filter(df, Property=="transitivity"), x = "Level", y = "Value", 
               color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Transitivity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("FengQ_2015")


p19<-ggboxplot(filter(df, Property=="assortativity"), x = "Level", y = "Value",
               color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Assortativity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("FengQ_2015")

p20<-ggboxplot(filter(df, Property=="algebraic_connectivity"), x = "Level", y = "Value",
               color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Algebraic connectivity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("FengQ_2015")

df<-filter(dat, Cohort=="ThomasAM_2018a")
p21 <- ggboxplot(filter(df, Property=="density"), x = "Level", y = "Value", #yscale = "log2",
                 color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Density")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("ThomasAM_2018a")

p22<-ggboxplot(filter(df, Property=="transitivity"), x = "Level", y = "Value", 
               color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Transitivity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("ThomasAM_2018a")


p23<-ggboxplot(filter(df, Property=="assortativity"), x = "Level", y = "Value",
               color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Assortativity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("ThomasAM_2018a")

p24<-ggboxplot(filter(df, Property=="algebraic_connectivity"), x = "Level", y = "Value",
               color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Algebraic connectivity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("ThomasAM_2018a")

df<-filter(dat, Cohort=="ThomasAM_2018b")
p25 <- ggboxplot(filter(df, Property=="density"), x = "Level", y = "Value", #yscale = "log2",
                 color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Density")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("ThomasAM_2018b")

p26<-ggboxplot(filter(df, Property=="transitivity"), x = "Level", y = "Value", 
               color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Transitivity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("ThomasAM_2018b")


p27<-ggboxplot(filter(df, Property=="assortativity"), x = "Level", y = "Value",
               color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Assortativity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("ThomasAM_2018b")

p28<-ggboxplot(filter(df, Property=="algebraic_connectivity"), x = "Level", y = "Value",
               color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Algebraic connectivity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("ThomasAM_2018b")


df<-filter(dat, Cohort=="YachidaS_2019")
p29 <- ggboxplot(filter(df, Property=="density"), x = "Level", y = "Value", #yscale = "log2",
                 color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Density")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("YachidaS_2019")

p30<-ggboxplot(filter(df, Property=="transitivity"), x = "Level", y = "Value", 
               color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Transitivity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("YachidaS_2019")


p31<-ggboxplot(filter(df, Property=="assortativity"), x = "Level", y = "Value",
               color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Assortativity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("YachidaS_2019")

p32<-ggboxplot(filter(df, Property=="algebraic_connectivity"), x = "Level", y = "Value",
               color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Algebraic connectivity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("YachidaS_2019")

df<-filter(dat, Cohort=="YuJ_2015")
p33 <- ggboxplot(filter(df, Property=="density"), x = "Level", y = "Value", #yscale = "log2",
                 color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Density")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("YuJ_2015")

p34<-ggboxplot(filter(df, Property=="transitivity"), x = "Level", y = "Value", 
               color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Transitivity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("YuJ_2015")


p35<-ggboxplot(filter(df, Property=="assortativity"), x = "Level", y = "Value",
               color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Assortativity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("YuJ_2015")

p36<-ggboxplot(filter(df, Property=="algebraic_connectivity"), x = "Level", y = "Value",
               color = "Group", palette = c("slateblue1" , "tomato"))+
  ylab("Algebraic connectivity")+
  stat_compare_means(aes(group = Group), label = "p.signif", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("YuJ_2015")

prow <- plot_grid(

  # p1 + theme(legend.position="none"),
  # p5 + theme(legend.position="none"),
  # p9 + theme(legend.position="none"),
  # p17 + theme(legend.position="none"),
  # p21 + theme(legend.position="none"),
  # p25 + theme(legend.position="none"),
  # p29 + theme(legend.position="none"),
  # p33 + theme(legend.position="none"),
  # # p13 + theme(legend.position="none"),
  # 
  # p2 + theme(legend.position="none"),
  # p6 + theme(legend.position="none"),
  # p10 + theme(legend.position="none"),
  # p18 + theme(legend.position="none"),
  # p22 + theme(legend.position="none"),
  # p26 + theme(legend.position="none"),
  # p30 + theme(legend.position="none"),
  # p34 + theme(legend.position="none"),
  # # p14 + theme(legend.position="none"),
  # 
  # p3 + theme(legend.position="none"),
  # p7 + theme(legend.position="none"),
  # p11 + theme(legend.position="none"),
  # p19 + theme(legend.position="none"),
  # p23 + theme(legend.position="none"),
  # p27 + theme(legend.position="none"),
  # p31 + theme(legend.position="none"),
  # p35 + theme(legend.position="none"),
  # # p15 + theme(legend.position="none"),
  # 
  # 
  p4 + theme(legend.position="none"),
  p8 + theme(legend.position="none"),
  p12 + theme(legend.position="none"),
  p20 + theme(legend.position="none"),
  p24 + theme(legend.position="none"),
  p28 + theme(legend.position="none"),
  p32 + theme(legend.position="none"),
  p36 + theme(legend.position="none"),
  # p16 + theme(legend.position="none"),
  
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

# legend <- get_legend(
#   # create some space to the left of the legend
#   p1 + theme(legend.box.margin = margin(0, 12, 0, 0))
# )
# plot_grid(prow, legend, rel_widths = c(3, .4))
dev.off()
