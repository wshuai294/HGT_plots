library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)
library(ggstance)

df<-read.table("transfer_enriched.csv", sep=",", header=TRUE)


df <- filter(df, p.adj < 0.05)

pdf(file="kegg_transfer_enriched.pdf", width=10, height=10, onefile=FALSE)


# Create the plot
h1<-ggplot(df, aes(x = pathway_name, y = fold)) +
  geom_point(aes(size = gene_num, color =  log10(p.adj))) +
  scale_color_gradient(low = "red", high = "blue") +
  theme_bw()+
  coord_flip()+
  xlab("Pathway")+
  ylab("Fold Enrichment")+
  scale_y_continuous(trans='log2')+
  geom_hline(yintercept = 1, linetype = "dashed")
h1

# h2 <- ggplot(df)+
#   geom_bar(mapping = aes(x = pathway_name, y = 1, fill = first_class), 
#            stat = "identity", 
#            width = 1)+
#   theme_void()+
#   theme(panel.spacing.x = unit(1, "mm"))+
#   coord_flip()+
#   facet_grid(.~first_class, scales = "free_x")
# 
# 
# legend <- plot_grid(get_legend(h2), get_legend(h1), ncol = 1)
# h1 <- h1 + theme(legend.position = "none")
# h2 <- h2 + theme(legend.position = "none")
# plot <- plot_grid(h2, h1, align = "v", ncol = 1, axis = "tb", rel_heights = c(0.5, 15))
# plot_grid(plot, legend, nrow = 1, rel_widths = c(10, 1.5))


dev.off()