library(ggplot2)
require(gridExtra)
library(grid)

library("cowplot")

library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)



dat<-read.table("amount_comparison.csv",sep=',', header=TRUE)
pdf(file="swift.pdf", width=8, height=4, onefile=FALSE)
theme_set(theme_classic())

# new_dat

p1<- ggplot(dat, aes(x=fraction, y=CPU.time)) +
  geom_line(aes(linetype=Complexity, color=Methods))+
  geom_point(aes(shape=Complexity, color=Methods ))+ scale_color_manual(values=c("slateblue1" , "tomato"))+ 
  xlab("Sampling fraction")+
  ylab("CPU time (hours)")



p2<- ggplot(dat, aes(x=fraction, y=Peak.RAM)) +
  geom_line(aes(linetype=Complexity, color=Methods))+
  geom_point(aes(shape=Complexity, color=Methods ))+ scale_color_manual(values=c("slateblue1" , "tomato"))+ 
  xlab("Sampling fraction")+
  ylab("Peak RAM (G)")+ylim(21.5, 22.5)




prow <- plot_grid(
  p1 + theme(legend.position="none"),
  p2 + theme(legend.position="none"),
  align = 'vh',
  hjust = -1,
  nrow = 1
)

legend <- get_legend(
  p1 + 
    guides(color = guide_legend(nrow = 1)) +
    theme(legend.position = "top")
)
plot_grid(prow, legend, ncol = 1, rel_heights = c(1, .1))

dev.off()