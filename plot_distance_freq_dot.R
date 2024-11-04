library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)

pdf(file="distance_freq.pdf", width=4, height=3, onefile=FALSE)

df<-read.table("distance_frequency_bin.csv", sep=",", header=TRUE)



#df$distance<-0.5*df$distance+0.25

#loess50 <- loess(frequency ~ distance, data=df, span=.5)
#smooth50 <- predict(loess50) 

r<-cor(df$distance, df$frequency, method = "spearman")
p<-cor.test(df$distance, df$frequency, method = "spearman")$p.value

ggplot(df, aes(x=distance, y=frequency)) +
  geom_bar(stat="identity", width = 0.45, position = "identity", fill = "skyblue") +
  theme_classic() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"))+
  xlab("Phylogenetic Distance")+
  ylab("HGT Frequency")+
  annotate("text", x = 2, y = 0.4, label = "Spearman correlation\n r=-0.89 \n p=5.42e-4", size = 5, color = "black", hjust = 0)





# p <- ggplot(df, aes(distance, frequency))
# p + geom_point(alpha = 8/10, aes(colour = "black"), size=0.5)+
#  ylim(c(0, 0.003))

# df$bin <- cut(df$distance, breaks = seq(0, 5, by = 0.2))
# 
# # Calculate summary statistics for each bin
# df_agg <- aggregate(frequency ~ bin, data = df, FUN = mean)
# 
# # Create bar plot
# ggplot(df_agg, aes(x = bin, y = frequency)) +
#   geom_bar(stat = "identity") +
#   labs(x = "Bins of x", y = "Mean of y")

r
p

dev.off()