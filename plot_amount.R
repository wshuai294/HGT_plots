library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)

df<-read.table("basic_stasitcis_count.csv", sep=",", header=TRUE)
pdf(file="HGT_amount.pdf", width=6, height=6, onefile=FALSE)

# p1<-ggplot(filter(df), aes(x=Bkp_count, y = after_stat(density))) +
#   # geom_histogram(position="identity", alpha=0.5,bins = 50, fill="skyblue", color="skyblue")+
#   geom_histogram(aes(y=..density..), 
#                  position="identity", bins=50, color="darkblue", fill="lightblue")+
#   xlab("No. of HGT BKP pairs")+
#   ylab("Density")+
#   # geom_density(lwd = 0.3, colour = "#F8766D",
#   #              fill = 4, alpha = 0.25)+
#   geom_density(alpha=.2) +
#   xlim(0, 2000)+
#   theme_classic()+
#   theme(panel.grid.major = element_blank(),
#         panel.grid.minor = element_blank(),
#         axis.line = element_line(colour = "black"),legend.position = "top")+ geom_vline(aes(xintercept=median(Bkp_count)),
                                                                                        # color="black", linetype="dashed", size=1)
p <- ggplot(df, aes(Bases, Bkp_count))
p + geom_point(alpha = 8/10, size=1)+
  xlim(c(0, 20000000000))+ylim(c(0, 2500))+
  theme_classic() +
  #geom_abline(colour='lightblue', linetype = 2, size=0.5)+
  xlab("Base number (bp)")+
  ylab("N.O. of HGT breakpoints")+
  annotate("text", x = 13000000000, y = 2200, label = "Spearman correlation\n r=0.47 \n p=6.3e-117", size = 5, color = "black", hjust = 0)



dev.off()


