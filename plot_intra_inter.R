library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)


df<-read.table("intra_order.csv", header=TRUE, sep=",")
tot<-read.table("intra_order_total.csv", header=TRUE, sep=",")
head(df)

tot<-filter(tot, Level != "species")
pdf("bar_inter_order.pdf", width=18, height=10)
tot$Level <- factor(tot$Level, levels = unique(tot$Level))
p <- ggplot(data=tot, aes(x=Level, y = Proportion, fill = Group)) +
  geom_bar(stat = "identity")+
  scale_x_discrete(guide = guide_axis(angle = 45))+ 
  scale_fill_manual(values=c('#1B9E77', '#D95F02'))+
  theme(axis.text.x = element_text(angle=45, hjust=1)) +
  xlab("")

df2 <- filter(df, level %in% 1:1)
df2$Order <- factor(df2$Order, levels = unique(df2$Order))
p1 <- ggplot(data=df2, aes(x=Order, y = Proportion, fill = Group)) +
  geom_bar(stat = "identity")+
  scale_x_discrete(guide = guide_axis(angle = 45))+ 
  scale_fill_manual(values=c('#1B9E77', '#D95F02'))+
  ggtitle("phylum") +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x=element_blank())+
  theme(axis.text.x = element_text(angle=45, hjust=0.4, size = 7))


df2 <- filter(df, level %in% 2:2)
df2$Order <- factor(df2$Order, levels = unique(df2$Order))
p2 <- ggplot(data=df2, aes(x=Order, y = Proportion, fill = Group)) +
  geom_bar(stat = "identity")+
  scale_x_discrete(guide = guide_axis(angle = 45))+ 
  scale_fill_manual(values=c('#1B9E77', '#D95F02'))+
ggtitle("class") +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x=element_blank())+
  theme(axis.text.x = element_text(angle=45, hjust=0.4, size = 7))

df2 <- filter(df, level %in% 3:3)
df2$Order <- factor(df2$Order, levels = unique(df2$Order))
p3 <- ggplot(data=df2, aes(x=Order, y = Proportion, fill = Group)) +
  geom_bar(stat = "identity")+
  scale_x_discrete(guide = guide_axis(angle = 45))+ 
  scale_fill_manual(values=c('#1B9E77', '#D95F02'))+
ggtitle("order") +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x=element_blank())+
  theme(axis.text.x = element_text(angle=45, hjust=0.4, size = 7))

df2 <- filter(df, level %in% 4:4)
df2$Order <- factor(df2$Order, levels = unique(df2$Order))
p4 <- ggplot(data=df2, aes(x=Order, y = Proportion, fill = Group)) +
  geom_bar(stat = "identity")+
  scale_x_discrete(guide = guide_axis(angle = 45))+ 
  scale_fill_manual(values=c('#1B9E77', '#D95F02'))+
ggtitle("family") +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x=element_blank())+
  theme(axis.text.x = element_text(angle=45, hjust=0.4, size = 7))


df2 <- filter(df, level %in% 5:5)
df2$Order <- factor(df2$Order, levels = unique(df2$Order))
p5 <- ggplot(data=df2, aes(x=Order, y = Proportion, fill = Group)) +
  geom_bar(stat = "identity")+
  scale_x_discrete(guide = guide_axis(angle = 45))+ 
  scale_fill_manual(values=c('#1B9E77', '#D95F02'))+
ggtitle("genus") +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x=element_blank())+
  theme(axis.text.x = element_text(angle=45, hjust=0.4, size = 7))


prow <- plot_grid(
  p + theme(legend.position="none"),
  p1 + theme(legend.position="none"),
  p2 + theme(legend.position="none"),
  p3 + theme(legend.position="none"),
  p4 + theme(legend.position="none"),
  p5 + theme(legend.position="none"),
  align = 'vh',
  hjust = -1,
  nrow = 2
)


legend <- get_legend(
  # create some space to the left of the legend
  p1 + theme(legend.box.margin = margin(0, 0, 0, 12))
)

plot_grid(prow, legend, rel_widths = c(3, .4))
# grid.arrange(p1, p2, ncol=2)

dev.off()