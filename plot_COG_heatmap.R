library(ggplot2)
require(gridExtra)
library(ggcorrplot)
# library(hrbrthemes)



df2<-read.table("COG_categories.csv", sep=",", header=TRUE)
head(df2)


pdf("COG_categories.pdf", width=30, height=20)


p1<-ggplot(df2, aes(COG, Sample, fill=Frequency )) +
  geom_tile()+ 
  scale_fill_gradient2(
    low = 'blue', high = 'red',
    midpoint = 0.13, guide = 'colourbar', aesthetics = 'fill'
  )
# +
  # scale_fill_distiller(palette = "Blues")



my_legend = c("A: RNA processing and modification", "B: Chromatin structure and dynamics", "C: Energy production and conversion", "D: Cell cycle control, cell division, chromosome partitioning", "E: Amino acid transport and metabolism", "F: Nucleotide transport and metabolism", "G: Carbohydrate transport and metabolism", "H: Coenzyme transport and metabolism", "I: Lipid transport and metabolism", "J: Translation, ribosomal structure and biogenesis", "K: Transcription", "L: Replication, recombination and repair", "M: Cell wall/membrane/envelope biogenesis", "N: Cell motility", "O: Posttranslational modification, protein turnover, chaperones", "P: Inorganic ion transport and metabolism", "Q: Secondary metabolites biosynthesis, transport and catabolism", "R: General function prediction only", "S: Function unknown", "T: Signal transduction mechanisms", "U: Intracellular trafficking, secretion, and vesicular transport", "V: Defense mechanisms", "W: Extracellular structures", "Y: Nuclear structure", "Z: Cytoskeleton")
p2 <- ggplot(df2, aes(x=COG, y=Frequency, fill=Function)) + 
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
    theme(plot.title = element_text(hjust = 0.5))
prow <- plot_grid(
  p1 + theme(legend.position="none"),
  p2 + theme(legend.position="none"),
  align = 'vh',
  
  nrow = 1
)
legend <- get_legend(
  # create some space to the left of the legend
  p2 + theme(legend.position="bottom")
)
#op <- par(cex = 1)
plot_grid(prow, legend,  rel_heights=c(1,1), rel_widths = c(2, 2))

#grid.arrange(p1, p2, ncol=2)
dev.off()