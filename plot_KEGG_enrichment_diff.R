library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)
library(ggstance)
library(scales)

pdf(file="kegg_diff_enriched.pdf", width=5, height=5, onefile=FALSE)

max_path<-18

df<-read.table("association/group1_CRC_control.csv", sep=",", header=TRUE)
df <- df[order(df$p.adj), ]
df <- head(df, max_path)

df <- df[rev(order(df$pathway_name)), ]
df$pathway_name <- factor(df$pathway_name, levels = df$pathway_name)

# Create the plot
p1<- ggplot(df, aes(x = pathway_name, y = fold)) +
  geom_point(aes(size = gene_num, color =  log10(p.adj))) +
  scale_color_gradient(low = "red", high = "blue") +
  scale_size_continuous(breaks = pretty_breaks(n = 3)) + 
  theme_bw()+
  coord_flip()+
  xlab("")+
  ylab("Fold Enrichment")+
  scale_y_continuous(trans='log2')+
  geom_hline(yintercept = 1, linetype = "dashed")+ theme(
    legend.position = "bottom",
    legend.box = "vertical",
    legend.margin = margin(t = 1, r = 1, b = 1, l = 1),
    plot.title = element_text(hjust = 0.5, size = 10, face = "plain", margin = margin(b = 5))
  )+
  ggtitle("CRC")+ guides(color = guide_colorbar(order = 1), 
                         size = guide_legend(order = 2))+ theme(legend.text = element_text(size = 6), 
                                                                legend.title = element_text(size = 6))

df<-read.table("association/group2_CRC_control.csv", sep=",", header=TRUE)
df <- df[order(df$p.adj), ]
df <- head(df, max_path)

df <- df[rev(order(df$pathway_name)), ]
df$pathway_name <- factor(df$pathway_name, levels = df$pathway_name)

# # Create the plot
# p2<- ggplot(df, aes(x = pathway_name, y = fold)) +
#   geom_point(aes(size = gene_num, color =  log10(p.adj))) +
#   scale_color_gradient(low = "red", high = "blue") +
#   scale_size_continuous(breaks = pretty_breaks(n = 3)) + 
#   theme_bw()+
#   coord_flip()+
#   xlab("")+
#   ylab("Fold Enrichment")+
#   scale_y_continuous(trans='log2')+
#   geom_hline(yintercept = 1, linetype = "dashed")+ theme(
#     legend.position = "bottom",
#     legend.box = "vertical",
#     legend.margin = margin(t = 1, r = 1, b = 1, l = 1),
#     plot.title = element_text(hjust = 0.5, size = 10, face = "plain", margin = margin(b = 5))
#   )+
#   ggtitle("control")+ guides(color = guide_colorbar(order = 1), 
#                          size = guide_legend(order = 2))+ theme(legend.text = element_text(size = 6), 
#                                                                 legend.title = element_text(size = 6))

p1

# grid.arrange(p1, p2, ncol = 2)
dev.off()