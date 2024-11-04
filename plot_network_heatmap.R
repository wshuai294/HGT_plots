library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)
library(reshape2)
# library(hrbrthemes)

# Get lower triangle of the correlation matrix
get_lower_tri<-function(cormat){
  cormat[upper.tri(cormat)] <- NA
  return(cormat)
}
# Get upper triangle of the correlation matrix
get_upper_tri <- function(cormat){
  cormat[lower.tri(cormat)]<- NA
  return(cormat)
}




df2<-read.table("network_comparison_matrix_transitivity.csv", sep=",", header=TRUE)
mat <- as.matrix(df2[, 3:9])
rownames(mat) <-df2$group
melted_cormat <- melt(mat, na.rm = TRUE)
p1<-ggplot(melted_cormat, aes(Var2, Var1, fill = value )) +
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "red", high = "skyblue", mid = "white",
                       midpoint = 0.5, limit = c(0,1), space = "Lab", 
                       name="p.adj") +
  theme_minimal()+ 
  theme(axis.text.x = element_text(angle = 315, face = "bold", size=10), axis.text.y = element_text(angle = 45, face = "bold", size=10))+
  coord_fixed()+ geom_text(aes(Var2, Var1,label = format(value, scientific = TRUE)), color = "black", size = 2)+
  xlab("") + ylab("")+ ggtitle("Transitivity")


df2<-read.table("network_comparison_matrix_assortativity.csv", sep=",", header=TRUE)
mat <- as.matrix(df2[, 3:9])
rownames(mat) <-df2$group
melted_cormat <- melt(mat, na.rm = TRUE)
p2<-ggplot(melted_cormat, aes(Var2, Var1, fill = value )) +
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "red", high = "skyblue", mid = "white",
                       midpoint = 0.5, limit = c(0,1), space = "Lab", 
                       name="p.adj") +
  theme_minimal()+ 
  theme(axis.text.x = element_text(angle = 315, face = "bold", size=10), axis.text.y = element_text(angle = 45, face = "bold", size=10))+
  coord_fixed()+ geom_text(aes(Var2, Var1,label = format(value, scientific = TRUE)), color = "black", size = 2)+
  xlab("") + ylab("")+ ggtitle("Assortativity")


df2<-read.table("network_comparison_matrix_algebraic_connectivity.csv", sep=",", header=TRUE)
mat <- as.matrix(df2[, 3:9])
rownames(mat) <-df2$group
melted_cormat <- melt(mat, na.rm = TRUE)
p3<-ggplot(melted_cormat, aes(Var2, Var1, fill = value )) +
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "red", high = "skyblue", mid = "white",
                       midpoint = 0.5, limit = c(0,1), space = "Lab", 
                       name="p.adj") +
  theme_minimal()+ 
  theme(axis.text.x = element_text(angle = 315, face = "bold", size=10), axis.text.y = element_text(angle = 45, face = "bold", size=10))+
  coord_fixed()+ geom_text(aes(Var2, Var1,label = format(value, scientific = TRUE)), color = "black", size = 2)+
  xlab("") + ylab("")+ ggtitle("Algebraic connectivity")


df2<-read.table("network_comparison_matrix_density.csv", sep=",", header=TRUE)
mat <- as.matrix(df2[, 3:9])
rownames(mat) <-df2$group
melted_cormat <- melt(mat, na.rm = TRUE)
p4<-ggplot(melted_cormat, aes(Var2, Var1, fill = value )) +
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "red", high = "skyblue", mid = "white",
                       midpoint = 0.5, limit = c(0,1), space = "Lab", 
                       name="p.adj") +
  theme_minimal()+ 
  theme(axis.text.x = element_text(angle = 315, face = "bold", size=10), axis.text.y = element_text(angle = 45, face = "bold", size=10))+
  coord_fixed()+ geom_text(aes(Var2, Var1,label = format(value, scientific = TRUE)), color = "black", size = 2)+
  xlab("") + ylab("")+ ggtitle("Density")


prow <- plot_grid(
  p1 + theme(legend.position="none"),
  p2 + theme(legend.position="none"),
  p3 + theme(legend.position="none"),
  p4 + theme(legend.position="none"),
  align = 'vh',
  hjust = -1,
  nrow = 1
)

legend <- get_legend(
  p4 + 
    guides(color = guide_legend(nrow = 1)) +
    theme(legend.position = "bottom")
)

pdf("network_heatmap.pdf", width=15, height=5)
plot_grid(prow, legend, ncol = 1, rel_heights = c(1, .1))

dev.off()
