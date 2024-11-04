library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)
library(ggstance)
library(scales)

name = "IGT_control"
pdf(file=paste0("association/kegg_diff_enriched_", name, ".pdf"), width=6, height=10, onefile=FALSE)
max_path<-18
df<-read.table(paste0("association/group1_", name, ".csv"), sep=",", header=TRUE)
df <- df[order(df$p.adj), ]
df <- head(df, max_path)

df <- df[rev(order(df$pathway_name)), ]
df$pathway_name <- factor(df$pathway_name, levels = df$pathway_name)

# Create the plot
p1<- ggplot(df, aes(x = pathway_name, y = fold)) +
  geom_point(aes(size = gene_num, color =  log10(p.adj))) +
  scale_color_gradient(low = "red", high = "blue", breaks = pretty_breaks(n = 4)) +
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
  ggtitle("group1")+ guides(color = guide_colorbar(order = 1), 
                         size = guide_legend(order = 2))

df<-read.table(paste0("association/group2_", name, ".csv"), sep=",", header=TRUE)
df <- df[order(df$p.adj), ]
df <- head(df, max_path)

df <- df[rev(order(df$pathway_name)), ]
df$pathway_name <- factor(df$pathway_name, levels = df$pathway_name)

# Create the plot
p2<- ggplot(df, aes(x = pathway_name, y = fold)) +
  geom_point(aes(size = gene_num, color =  log10(p.adj))) +
  scale_color_gradient(low = "red", high = "blue", breaks = pretty_breaks(n = 4)) +
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
  ggtitle("group2")+ guides(color = guide_colorbar(order = 1), 
                             size = guide_legend(order = 2))



grid.arrange(p1, p2, ncol = 1)
dev.off()