
library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)


df <- read.table("For_methods/pure_snp_comparison.csv",sep=',', header=TRUE)
df$snp<-sapply(df$snp, as.factor)
pdf(file="For_methods/pure_benchmark.pdf", width=8, height=3, onefile = FALSE)


df.summary <- df %>%
  group_by(snp, Methods) %>%
  summarise(
    sd = sd(F1.score, na.rm = TRUE),
    F1.score = mean(F1.score)
  )

df2 <- read.table("For_methods/depth_comparison.csv",sep=',', header=TRUE)
df2$Depth<-sapply(df2$Depth, as.factor)


df2.summary <- df2 %>%
  group_by(Depth, Methods) %>%
  summarise(
    sd = sd(F1.score, na.rm = TRUE),
    F1.score = mean(F1.score)
  )






p1<-ggplot(df.summary, aes(snp, F1.score)) +
  geom_errorbar(
    aes(ymin = F1.score-sd, ymax = F1.score+sd, color = Methods),
    position = position_dodge(0.3), width = 0.2
  )+
  geom_point(aes(color = Methods), position = position_dodge(0.3)) +
  scale_color_manual(values = c("slateblue1" , "tomato"))+
  ylab("F1 score") +theme(legend.position="bottom")+
  ylim(0.8, 1.01)+
  xlab("Mutation Rate")



p2<-ggplot(df2.summary, aes(Depth, F1.score)) +
  geom_errorbar(
    aes(ymin = F1.score-sd, ymax = F1.score+sd, color = Methods),
    position = position_dodge(0.3), width = 0.2
  )+
  geom_point(aes(color = Methods), position = position_dodge(0.3)) +
  scale_color_manual(values = c("slateblue1" , "tomato"))+
  ylab("F1 score") +theme(legend.position="bottom")


prow <- plot_grid(
  p2 + theme(legend.position="none"),
  p1 + theme(legend.position="none"),
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