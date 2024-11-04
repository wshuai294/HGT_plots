library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)

df<-read.table("network_comparison_normalized.csv", sep=",", header=TRUE)

# df<-filter(df, Cohort !="WirbelJ_2018", Bases > 0*(10**9) & Bases < 15*10**9)
# df$Value <- df$Origin/log(df$Bases, 2)

pdf(file="network_comparison.pdf", width=18, height=10, onefile=FALSE)


p1 <- ggboxplot(filter(df, Property=="density"), x = "Level", y = "Value", 
               color = "Group", palette = c("slateblue1" , "tomato"), add="mean")+
                ylab("Density")+
                stat_compare_means(aes(group = Group), label = "p.format", method = "wilcox.test")+ 
                grids(linetype = "dashed")+
                xlab("")+
                ylim(c(0,1.1))

p2<-ggboxplot(filter(df, Property=="transitivity"), x = "Level", y = "Value",
              color = "Group", palette = c("slateblue1" , "tomato"), add="mean")+
  ylab("Transitivity")+
  stat_compare_means(aes(group = Group), label = "p.format", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("")+
  ylim(c(0,0.9))


p3<-ggboxplot(filter(df, Property=="assortativity"), x = "Level", y = "Value",
              color = "Group", palette = c("slateblue1" , "tomato"), add="mean")+
  ylab("Assortativity")+
  stat_compare_means(aes(group = Group), label = "p.format", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("")+
  ylim(c(-1,0.9))

p4<-ggboxplot(filter(df, Property=="algebraic_connectivity"), x = "Level", y = "Value",
              color = "Group", palette = c("slateblue1" , "tomato"), add="mean")+
  ylab("Algebraic connectivity")+
  stat_compare_means(aes(group = Group), label = "p.format", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("") +
  ylim(c(0,2.1))

p5<-ggboxplot(filter(df, Property=="Node"), x = "Level", y = "Value", yscale = "log2",
              color = "Group", palette = c("slateblue1" , "tomato"), add="mean")+
  ylab("N.O. of nodes")+
  stat_compare_means(aes(group = Group), label = "p.format", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("")

p6<-ggboxplot(filter(df, Property=="Edge"), x = "Level", y = "Value", yscale = "log10",
              color = "Group", palette = c("slateblue1" , "tomato"), add="mean")+
  ylab("N.O. of edges")+
  stat_compare_means(aes(group = Group), label = "p.format", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("")




prow <- plot_grid(
  # p5 + theme(legend.position="none"),
  # p6 + theme(legend.position="none"),
  p2 + theme(legend.position="none"),
  p3 + theme(legend.position="none"),
  p4 + theme(legend.position="none"),
  p1 + theme(legend.position="none"),
  align = 'vh',
  hjust = -1,
  nrow = 2
)

legend <- get_legend(
  p1 + 
    guides(color = guide_legend(nrow = 1)) +
    theme(legend.position = "none")
)
plot_grid(prow, legend, ncol = 1, rel_heights = c(1, .1))

# legend <- get_legend(
#   # create some space to the left of the legend
#   p1 + theme(legend.box.margin = margin(0, 12, 0, 0))
# )
# plot_grid(prow, legend, rel_widths = c(3, .4))
dev.off()