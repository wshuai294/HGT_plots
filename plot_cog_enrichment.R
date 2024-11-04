library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)
library(ggstance)

df<-read.table("cog_enrich.csv", sep=",", header=TRUE)
#df<-read.table("cog_transfer.csv", sep=",", header=TRUE)


#df <- filter(df, p.adj < 0.05)

pdf(file="COG_transfer_enriched.pdf", width=10, height=6, onefile=FALSE)


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

type_order <- c("Cellular processes and signaling", "Metabolism", "Information storage and Processing", "Function unknown")
#df$locus_type = factor(df$locus_type, levels=type_order)
# Create the plot

  ggplot(df,aes(y=fold,x=category_detail,fill=log10(p.adj+ 1e-30)))+ 
  geom_bar(stat="identity",position = "dodge") +
  scale_fill_gradient(low = "red", high = "blue") +
  theme_bw()+
  coord_flip()+
  xlab("")+
  ylab("Fold Enrichment")+
  scale_y_continuous(trans='log2')+
  geom_hline(yintercept = 1, linetype = "dashed") +
  facet_grid(profile~locus_type,scales = "free",space = "free") +
  theme(strip.text.y = element_text(angle = 0), legend.position = "bottom")+ theme(legend.text = element_text(size = 6), 
                                                                                   legend.title = element_text(size = 6))


dev.off()