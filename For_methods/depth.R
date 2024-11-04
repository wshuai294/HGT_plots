library(ggplot2)
library(dplyr)
# require(gridExtra)
# library(grid)

df <- read.table("depth_comparison.csv",sep=',', header=TRUE)
df$Depth<-sapply(df$Depth, as.factor)
pdf(file="depth.pdf", width=6, height=3)
# dep

df.summary <- df %>%
  group_by(Depth, Methods) %>%
  summarise(
    sd = sd(F1.score, na.rm = TRUE),
    F1.score = mean(F1.score)
  )
df.summary




ggplot(df.summary, aes(Depth, F1.score)) +
  geom_errorbar(
    aes(ymin = F1.score-sd, ymax = F1.score+sd, color = Methods),
    position = position_dodge(0.3), width = 0.2
    )+
  geom_point(aes(color = Methods), position = position_dodge(0.3)) +
  scale_color_manual(values = c("slateblue1" , "tomato"))+
    ylab("F1 score") +theme(legend.position="bottom")

  

dev.off()
  

# head(df)


