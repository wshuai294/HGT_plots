library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)
library(ggstance)
library(scales)

pdf(file="kegg_bkp_enriched.pdf", width=16, height=5, onefile=FALSE)

max_path<-18

df<-read.table("bkp_enriched.csv", sep=",", header=TRUE)
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
  ggtitle("BKP")+ guides(color = guide_colorbar(order = 1), 
                         size = guide_legend(order = 2))+ theme(legend.text = element_text(size = 6), 
                                                                legend.title = element_text(size = 6))
p1


# Create the plot
df<-read.table("transfer_enriched.csv", sep=",", header=TRUE)
df <- df[order(df$p.adj), ]
df <- head(df, max_path)

df <- df[rev(order(df$pathway_name)), ]
df$pathway_name <- factor(df$pathway_name, levels = df$pathway_name)

p2<- ggplot(df, aes(x = pathway_name, y = fold)) +
  geom_point(aes(size = gene_num, color =  log10(p.adj))) +
  scale_size_continuous(breaks = pretty_breaks(n = 3)) + 
  scale_color_gradient(low = "red", high = "blue") +
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
  ggtitle("transfer")+ guides(color = guide_colorbar(order = 1), 
                              size = guide_legend(order = 2))+ theme(legend.text = element_text(size = 6), 
                                                                     legend.title = element_text(size = 6))
p2

# Create the plot
df<-read.table("insert_enriched.csv", sep=",", header=TRUE)
df <- df[order(df$p.adj), ]
df <- head(df, max_path)

df <- df[rev(order(df$pathway_name)), ]
df$pathway_name <- factor(df$pathway_name, levels = df$pathway_name)

p3<- ggplot(df, aes(x = pathway_name, y = fold)) +
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
  ggtitle("insert")+ guides(color = guide_colorbar(order = 1), 
                            size = guide_legend(order = 2))+ theme(legend.text = element_text(size = 6), 
                                                                   legend.title = element_text(size = 6))

grid.arrange(p1, p3, p2, ncol = 3)

dev.off()