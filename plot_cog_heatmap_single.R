library(ggplot2)
require(gridExtra)
library(ggcorrplot)
# library(hrbrthemes)



df2<-read.table("COG_categories.csv", sep=",", header=TRUE)
head(df2)


pdf("COG_categories_heatmap.pdf", width=18, height=10)


ggplot(df2, aes(COG, Sample, fill=Frequency )) +
  geom_tile()+ 
  scale_fill_gradient2(
    low = 'blue', high = 'red',
    midpoint = 0.13, guide = 'colourbar', aesthetics = 'fill'
  )
# +
# scale_fill_distiller(palette = "Blues")



#grid.arrange(p1, p2, ncol=2)
dev.off()