library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)

df<-read.table("HGT_individual_sample_group.csv", sep="\t", header=TRUE)
pdf(file="HGT_count_histogram_group.pdf", width=10, height=8, onefile=FALSE)

p1<-ggplot(filter(df, level %in% 1:1), aes(x=genome_pair, y = ..density..)) +
  geom_histogram(position="identity", alpha=0.5,bins = 100, fill="#F8766D", color="#F8766D")+
  xlab("phylum")+
  geom_density(lwd = 0.3, colour = "#00BFC4",
                             fill = 4, alpha = 0.25)

# p2<-ggplot(filter(df, level %in% 2:2), aes(x=genome_pair, fill=group, color=group)) +
#   geom_histogram(position="identity", alpha=0.5,bins = 100)+
#   xlab("class")

p2<-ggplot(filter(df, level %in% 2:2), aes(x=genome_pair, y = ..density..)) +
  geom_histogram(position="identity", alpha=0.5,bins = 100, fill="#F8766D", color="#F8766D")+
  xlab("class")+
  geom_density(lwd = 0.3, colour = "#00BFC4",
               fill = 4, alpha = 0.25)
# 
# p3<-ggplot(filter(df, level %in% 3:3), aes(x=genome_pair, fill=group, color=group)) +
#   geom_histogram(position="identity", alpha=0.5,bins = 100)+
#   xlab("order")
# 

p3<-ggplot(filter(df, level %in% 3:3), aes(x=genome_pair, y = ..density..)) +
  geom_histogram(position="identity", alpha=0.5,bins = 100, fill="#F8766D", color="#F8766D")+
  xlab("order")+
  geom_density(lwd = 0.3, colour = "#00BFC4",
               fill = 4, alpha = 0.25)

# p4<-ggplot(filter(df, level %in% 4:4), aes(x=genome_pair, fill=group, color=group)) +
#   geom_histogram(position="identity", alpha=0.5,bins = 100)+
#   xlab("family")

p4<-ggplot(filter(df, level %in% 4:4), aes(x=genome_pair, y = ..density..)) +
  geom_histogram(position="identity", alpha=0.5,bins = 100, fill="#F8766D", color="#F8766D")+
  xlab("family")+
  geom_density(lwd = 0.3, colour = "#00BFC4",
               fill = 4, alpha = 0.25)
# 
# p5<-ggplot(filter(df, level %in% 5:5), aes(x=genome_pair, fill=group, color=group)) +
#   geom_histogram(position="identity", alpha=0.5,bins = 100)+
#   xlab("genus")

p5<-ggplot(filter(df, level %in% 5:5), aes(x=genome_pair, y = ..density..)) +
  geom_histogram(position="identity", alpha=0.5,bins = 100, fill="#F8766D", color="#F8766D")+
  xlab("genus")+
  geom_density(lwd = 0.3, colour = "#00BFC4",
               fill = 4, alpha = 0.25)
# 
# p6<-ggplot(filter(df, level %in% 6:6), aes(x=genome_pair, fill=group, color=group)) +
#   geom_histogram(position="identity", alpha=0.5,bins = 100)+
#   xlab("species")

p6<-ggplot(filter(df, level %in% 6:6), aes(x=genome_pair, y = ..density..)) +
  geom_histogram(position="identity", alpha=0.5,bins = 100, fill="#F8766D", color="#F8766D")+
  xlab("species")+
  geom_density(lwd = 0.3, colour = "#00BFC4",
               fill = 4, alpha = 0.25)


prow <- plot_grid(
  p1 + theme(legend.position="none"),
  p2 + theme(legend.position="none"),
  p3 + theme(legend.position="none"),
  p4 + theme(legend.position="none"),
  p5 + theme(legend.position="none"),
  p6 + theme(legend.position="none"),
  align = 'vh',
  hjust = -1,
  nrow = 3
)


legend <- get_legend(
  # create some space to the left of the legend
  p2 + theme(legend.box.margin = margin(0, 0, 0, 12))
)

plot_grid(prow, legend, rel_widths = c(3, .4))
dev.off()