library(ggplot2)
require(gridExtra)
library(ggcorrplot)
# library(hrbrthemes)



df2<-read.table("COG_categories.csv", sep=",", header=TRUE)
head(df2)


pdf("COG_categories_boxplot.pdf", width=18, height=10)

ggplot(df2, aes(x=COG, y=Frequency, fill=Function)) + 
  geom_boxplot(
    
    # custom boxes
    # color="blue",
    # fill="blue",
    alpha=0.2,
    
    # Notch?
    notch=FALSE,
    notchwidth = 0.8,
    
    # custom outliers
    outlier.colour="red",
    outlier.fill="red",
    outlier.size=2
    
  )+
  ggtitle("")+
  theme(plot.title = element_text(hjust = 0.5)) + theme(legend.position="bottom")

dev.off()