library(ggplot2)
library(dplyr)
# require(gridExtra)
# library(grid)

df <- read.table("For_methods/pure_frag_comparison.csv",sep=',', header=TRUE)
df$frag<-sapply(df$frag, as.factor)
pdf(file="For_methods/frag_size.pdf", width=6, height=4)
# dep

df.summary <- df %>%
  group_by(frag, Methods) %>%
  summarise(
    sd = sd(F1, na.rm = TRUE),
    F1 = mean(F1)
  )
df.summary




ggplot(df.summary, aes(frag, F1)) +
  geom_errorbar(
    aes(ymin = F1-sd, ymax = F1+sd, color = Methods),
    position = position_dodge(0.3), width = 0.2
  )+
  geom_point(aes(color = Methods), position = position_dodge(0.3)) +
  scale_color_manual(values = c("slateblue1" , "tomato"))+
  ylab("F1 score") +theme(legend.position="bottom")+xlab("Insert size")



dev.off()


# head(df)


