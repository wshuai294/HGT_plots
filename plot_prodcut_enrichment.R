library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)
library(ggstance)

df<-read.table("product_enrich.csv", sep=",", header=TRUE)


#df <- filter(df, p.adj < 0.05)

pdf(file="enriched_product.pdf", width=15, height=5, onefile=FALSE)


# # Create the plot
# ggplot(df, aes(x = category_detail, y = fold)) +
#   geom_point(aes(size = gene_num, color =  log10(p.adj))) +
#   scale_color_gradient(low = "red", high = "blue") +
#   theme_bw()+
#   coord_flip()+
#   xlab("COG")+
#   ylab("Fold Enrichment")+
#   scale_y_continuous(trans='log2')+
#   geom_hline(yintercept = 1, linetype = "dashed") +
#   facet_grid(profile~.,scales = "free",space = "free")+
#     theme(strip.text.y = element_text(angle = 0))


# Create the plot

ggplot(df,aes(y=fold,x=category,fill=log10(p.adj+1e-100)))+ 
  geom_bar(stat="identity",position = "dodge") +
  scale_fill_gradient(low = "red", high = "blue") +
  theme_bw()+
  coord_flip()+
  xlab("Gene categories")+
  ylab("Fold Enrichment")+
  scale_y_continuous(trans='log2')+
  geom_hline(yintercept = 1, linetype = "dashed") +
  facet_grid(.~locus_type,scales = "free",space = "free")+
  theme(strip.text.y = element_text(angle = 0))


dev.off()