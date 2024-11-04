library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)

dat<-read.table("HGT_count_sample.csv", sep="\t", header=TRUE)
pdf(file="HGT_count_sample_group.pdf", width=7, height=3, onefile=FALSE)

p1 <- ggplot(filter(dat, level %in% 1:1), aes(x = sample, y = HGT_count)) +
  geom_line(aes(color="#F8766D"))+ 
  ylab("Count")+
  ggtitle("phylum")+
  theme(
    plot.title = element_text(size=9, hjust = 0.5),
    axis.title.x = element_text(size=8),
    axis.title.y = element_text(size=8)
  )

p2 <- ggplot(filter(dat, level %in% 2:2), aes(x = sample, y = HGT_count)) +
   geom_line(aes(color="#F8766D"))+ 
   ylab("Count")+
  ggtitle("class")+
  theme(
    plot.title = element_text(size=9, hjust = 0.5),
    axis.title.x = element_text(size=8),
    axis.title.y = element_text(size=8)
  )

p3 <- ggplot(filter(dat, level %in% 3:3), aes(x = sample, y = HGT_count)) +
  geom_line(aes(color="#F8766D"))+ 
  ylab("Count")+
  ggtitle("order")+
  theme(
    plot.title = element_text(size=9, hjust = 0.5),
    axis.title.x = element_text(size=8),
    axis.title.y = element_text(size=8)
  )

p4 <- ggplot(filter(dat, level %in% 4:4), aes(x = sample, y = HGT_count)) +
  geom_line(aes(color="#F8766D"))+ 
  ylab("Count")+
  ggtitle("family")+
  theme(
    plot.title = element_text(size=9, hjust = 0.5),
    axis.title.x = element_text(size=8),
    axis.title.y = element_text(size=8)
  )

p5 <- ggplot(filter(dat, level %in% 5:5), aes(x = sample, y = HGT_count)) +
  geom_line(aes(color="#F8766D"))+ 
  ylab("Count")+
  ggtitle("genus")+
  theme(
    plot.title = element_text(size=9, hjust = 0.5),
    axis.title.x = element_text(size=8),
    axis.title.y = element_text(size=8)
  )

p6 <- ggplot(filter(dat, level %in% 6:6), aes(x = sample, y = HGT_count)) +
  geom_line(aes(color="#F8766D"))+ 
  ylab("Count")+
  ggtitle("species")+
  theme(
    plot.title = element_text(size=9, hjust = 0.5),
    axis.title.x = element_text(size=8),
    axis.title.y = element_text(size=8)
  )





prow <- plot_grid(
  p1 + theme(legend.position="none"),
  p2 + theme(legend.position="none"),
  p3 + theme(legend.position="none"),
  p4 + theme(legend.position="none"),
  p5 + theme(legend.position="none"),
  p6 + theme(legend.position="none"),
  align = 'vh',
  hjust = -1,
  nrow = 2
)


# legend <- get_legend(
#   # create some space to the left of the legend
#   p2 + theme(legend.box.margin = margin(0, 0, 0, 12))
# )

plot_grid(prow, rel_widths = c(3, .4))

dev.off()