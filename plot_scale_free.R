library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)

all_df<-read.table("scale_free.csv", sep=",", header=TRUE)
my_levels <- c("phylum", "class", "order", "family", "genus", "species")
my_distri <- c("lognormal_positive", "exponential", "Weibull")

pdf(file="scale_free.pdf", width=3, height=2.5, onefile=FALSE)

# pow_percentage <- c()
# levels_list <- c()
# distribution <- c()
# 
# # df <- filter(all_df, Group == "CRC")
# df <- all_df
# 
# for (this_level in my_levels){
#   for (this_dictri in my_distri){
#     dat <- filter(df, Level == this_level & Comparison==this_dictri)
#     
#     over_zero <- colSums(dat[c("ratio")] > 0)
#     all_num <- colSums(dat[c("ratio")] > -1000000)
#     pow_rate <- over_zero/all_num
#     
#     pow_percentage <- append(pow_percentage, pow_rate)
#     levels_list <- append(levels_list, this_level)
#     distribution <- append(distribution, this_dictri)
#     print (this_dictri)
#   }
# }
# 
# my_data <- data.frame(pow_percentage, levels_list, distribution)
# 
# my_data$levels_list <- as.character(my_data$levels_list)
# my_data$levels_list <- factor(my_data$levels_list, levels=my_levels)
# 
# 
# p<-ggplot(my_data, aes(x=levels_list, y=pow_percentage, group=distribution)) +
#   geom_line(aes(color=distribution))+
#   geom_point(aes(shape=distribution))+
#   xlab("")+
#   ylab("Proportion")+
#   theme(axis.text.x = element_text(angle=0, hjust=0.4, size = 6))+
#   theme(axis.title.y = element_text(size = 8))
# p
# 
# 
# write.csv(my_data, file="scale_free_ratio.csv")

df<-read.table("scale_free.csv", sep=",", header=TRUE)

df$level <- factor(df$level, levels=df$level)

ggplot(data=df, aes(x=level, y=Frequency, group=1)) +
  geom_line(color="red")+
  geom_point()+
  theme_classic()+ scale_y_continuous(limits=c(0, 1))+
  xlab("")+ 
  ylab("scale-free Frequency")+theme(axis.text.x = element_text(angle = 315, size=11, face = "bold"))

dev.off()