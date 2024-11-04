library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)

df<-read.table("phenotype.csv", sep=",", header=TRUE)
pdf(file="HGT_amount_cohort.pdf", width=12, height=6, onefile=FALSE)

ggplot(df, aes(x=cohort, y=bases)) + 
  geom_boxplot(
    
    # custom boxes
    # color="blue",
    fill="#56B4E9",
    alpha=0.8,
    
    # Notch?
    notch=FALSE,
    notchwidth = 0.8,
    
    # custom outliers
    outlier.colour="red",
    outlier.fill="red",
    outlier.size=2
    
  )+
  ggtitle("")+
  theme(plot.title = element_text(hjust = 0.5)) + theme(legend.position="bottom",)+ theme(axis.text.x = element_text(angle = 315))+
  ylab("Sequencing output amount (bp)")


dev.off()


