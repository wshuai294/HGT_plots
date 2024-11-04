library(ggplot2)


df <- read.table("For_methods/pure_length_comparison.csv",sep=',', header=TRUE)

pdf(file="For_methods/length.pdf", width=5, height=5)
df$length<-sapply(df$length, as.factor)

# ggboxplot(df, x=length, y = "F1.score")



ggplot(df, aes(x=Methods, y=F1, color = Methods)) + 
  geom_boxplot() +
  scale_color_manual(values = c("slateblue1" , "tomato"))+
  scale_fill_manual(values = c("slateblue1" , "tomato"))+ 
  geom_dotplot(binaxis='y', stackdir='center',position=position_dodge(1), binwidth=1/1000)+
  ylab("F1 score")


# +ylim(0.9, 1)


dev.off()