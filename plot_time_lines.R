library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)

pdf(file="time_lines_diff.pdf", width=3, height=6, onefile=FALSE)

df<-read.table("time_line_jaccard.csv", sep=",", header=TRUE)
da<-read.table("time_line_correlation.csv", sep=",", header=TRUE)



p1 <- ggboxplot(da, x = "group", y = "correlation",
                fill = "group", palette = c("slateblue1" , "tomato"), add="mean", outlier.shape = NA)+
  ylab("Spearman Correlation")+
  xlab("")+
  annotate("text", x = 1.5, y = 0.8, label = "p=8.2e-269", size = 4, color = "black")

#p1


p2 <- ggboxplot(df, x = "group", y = "jaccard",
                fill = "group", palette = c("slateblue1" , "tomato"), add="mean", outlier.shape = NA)+
  ylab("Jaccard Similarity")+
  xlab("")+
  annotate("text", x = 1.5, y = 0.5, label = "p=4.3e-303", size = 4, color = "black")

#p2

#+grids(linetype = "dashed")
#+ geom_jitter(shape=16, position=position_jitter(0.2))
#+stat_compare_means(aes(group = group), label = "p.format", method = "wilcox.test")

prow <- plot_grid(
  p1 + theme(legend.position="none"),
  p2 + theme(legend.position="none"),
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

dev.off()