library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)

pdf(file="association/diff_points_acute_diarrhoea.pdf", width=4, height=3, onefile=FALSE)

df<-read.table("association/real_diff_pair_genus_acute_diarrhoea_control.csv", sep=",", header=TRUE)



p <- ggplot(df, aes(acute_diarrhoea, control))+
  geom_point(aes(color =  log10(p.adj), shape=Escherichia)) +
  scale_color_gradient(low = "red", high = "blue")+
  geom_abline(colour='black', linetype = 2, size=0.3)+
  theme_classic()+
  xlab("acute diarrhoea")
p

# p + geom_point(alpha = 8/10, aes(colour = p.adj), size=0.5)+
#   xlim(c(0, 1))+ylim(c(0, 1))+
#   geom_abline(colour='lightblue', linetype = 2, size=0.5)





dev.off()