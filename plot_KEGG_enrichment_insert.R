library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)
library(ggstance)

df<-read.table("insert_enriched.csv", sep=",", header=TRUE)


df <- filter(df, p.adj < 0.05)

pdf(file="kegg_insert_enriched.pdf", width=10, height=10, onefile=FALSE)


# Create the plot
ggplot(df, aes(x = pathway_name, y = fold)) +
  geom_point(aes(size = gene_num, color =  log10(p.adj))) +
  scale_color_gradient(low = "red", high = "blue") +
  theme_bw()+
  coord_flip()+
  xlab("Pathway")+
  ylab("Fold Enrichment")+
  scale_y_continuous(trans='log2')+
  geom_hline(yintercept = 1, linetype = "dashed")

# +
#   facet_grid(first_class~.,scales = "free",space = "free")+
#   theme(strip.text.y = element_text(angle = 0))


dev.off()