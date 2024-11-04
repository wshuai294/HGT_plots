library(ggplot2)
require(gridExtra)
# library(hrbrthemes)
library("gplots")


df2<-read.table("genome_sample.csv", header=TRUE)
head(df2)


pdf("genome_density_heatmap.pdf", width=12, height=6)

# df2$Sample_Number<-log(df2$Sample_Number)

ggplot(df2, aes(Position, Genome, fill=Sample_Number )) + 
  geom_tile()+ 
  scale_fill_distiller(palette = "Spectral", direction = -1) +
    theme(text = element_text(size=6))



dev.off()