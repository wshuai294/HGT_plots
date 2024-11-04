library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)

df<-read.table("network_comparison_normalized.csv", sep=",", header=TRUE)

# df<-filter(df, Cohort !="WirbelJ_2018", Bases > 0*(10**9) & Bases < 15*10**9)
# df$Value <- df$Origin/log(df$Bases, 2)

pdf(file="network_comparison.pdf", width=18, height=6, onefile=FALSE)


p1 <- ggboxplot(filter(df, Property=="density"), x = "Group", y = "Value",
                color = "Group")+
  ylab("Density")+
  grids()+
  xlab("") + theme(axis.text.x = element_text(angle = 315))

p2<-ggboxplot(filter(df, Property=="transitivity"), x = "Group", y = "Value",
              color = "Group")+
  ylab("Transitivity")+
  grids()+
  xlab("")+ theme(axis.text.x = element_text(angle = 315))


p3<-ggboxplot(filter(df, Property=="assortativity"), x = "Group", y = "Value",
              color = "Group")+
  ylab("Assortativity")+
  grids()+
  xlab("")+ theme(axis.text.x = element_text(angle = 315))

p4<-ggboxplot(filter(df, Property=="algebraic_connectivity"), x = "Group", y = "Value",
              color = "Group")+
  ylab("Algebraic connectivity")+
  grids()+
  xlab("") + theme(axis.text.x = element_text(angle = 315))


prow <- plot_grid(
  p2 + theme(legend.position="none"),
  p3 + theme(legend.position="none"),
  p4 + theme(legend.position="none"),
  p1 + theme(legend.position="none"),
  align = 'vh',
  hjust = -1,
  nrow = 1
)

legend <- get_legend(
  p2 + 
    guides(color = guide_legend(nrow = 1)) +
    theme(legend.position = "top")
)
plot_grid(prow, legend, ncol = 1, rel_heights = c(1, .1))

dev.off()