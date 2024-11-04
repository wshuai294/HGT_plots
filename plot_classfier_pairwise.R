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


pdf("classify_pairwise.pdf", width=5, height=5)


df2<-read.table("classifier_pairwise.csv", sep=",", header=TRUE)
mat <- as.matrix(df2[, 3:8])
rownames(mat) <-df2$group

melted_cormat <- melt(mat, na.rm = TRUE)
  ggplot(melted_cormat, aes(Var2, Var1, fill = value )) +
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "skyblue", high = "red", mid = "white", midpoint = 0.85,
                        limit = c(0.7,1), space = "Lab", 
                       name="AUC") +
  theme_minimal()+ 
  theme(axis.text.x = element_text(angle = 315, face = "bold", size=10), axis.text.y = element_text(angle = 45, face = "bold", size=10))+
  coord_fixed()+ geom_text(aes(Var2, Var1,label = format(value, scientific = FALSE)), color = "black", size = 5)+
  xlab("") + ylab("")
  #+ ggtitle("Transitivity")


dev.off()
