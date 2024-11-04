library(ggplot2)
library(plyr)
library(cowplot)
library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)




# df<-read.table("transfer_times.csv", sep=",", header=TRUE)
# 
# df$times <- factor(df$times)
# 
# ggplot(df, aes(x=times, y=frequency, fill=group)) +
#   geom_bar(stat="identity", color="black", position=position_dodge())+
#   theme_classic() +
#   theme(panel.grid.major = element_blank(),
#         panel.grid.minor = element_blank(),
#         axis.line = element_line(colour = "black"))+
#   xlab("Transfer Times")+
#   ylab("Frequency")+ scale_fill_brewer(palette="Blues")


# +
#   xlim(c(0,10))
# geom_bar(stat="identity", width = 0.8, position = "identity", fill = "skyblue") +


df <- data.frame(
  group = c("Single", "Multiple"),
  value = c(10450, 8894)
)

p1<- ggplot(df, aes(x="", y=value, fill=group))+
  geom_bar(width = 1, stat = "identity")+
  coord_polar("y", start=0)+ 
  scale_fill_brewer(palette="Dark2")+
  theme_minimal()+
  ggtitle("The proportion of single and multiple\n transfers of a sequence")+
  xlab("")+
  ylab("")+ theme(plot.title = element_text(size = 10))
#bp

df <- data.frame(
  group = c("Single", "Multiple"),
  value = c(12897, 6447)
)

p2<- ggplot(df, aes(x="", y=value, fill=group))+
  geom_bar(width = 1, stat = "identity")+
  coord_polar("y", start=0)+ 
  scale_fill_brewer(palette="Dark2")+
  theme_minimal()+
  ggtitle("The proportion of single and multiple\n transfers of a sequence to a same\n genome")+
  xlab("")+
  ylab("")+ theme(plot.title = element_text(size = 10))
#bp2

#grid.arrange(bp, bp2, ncol = 2)

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
    theme(legend.position = "bottom")
)
pdf(file="transfer_times.pdf", width=6, height=3)
plot_grid(prow, legend, ncol = 1, rel_heights = c(1, .1))

dev.off()

