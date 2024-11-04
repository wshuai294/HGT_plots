  library(ggplot2)
  library(dplyr)
  require(gridExtra)
  library(grid)
  library(cowplot)
  library(ggpubr)
  
  pdf(file="trasnfer_times_count.pdf", width=4, height=3, onefile=FALSE)
  
  df<-read.table("transfer_times_seq.csv", sep=",", header=TRUE)
  
  df$count<-factor(df$count, levels = df$count)
  
  
  ggplot(df, aes(x=count, y=number)) +
    geom_bar(stat="identity", position = "identity", fill = "skyblue") +  # width = 0.45
    theme_classic() +
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          axis.line = element_line(colour = "black"))+
    xlab("No. of insertion sites")+
    ylab("No. of transferred sequences")
  # +
    # annotate("text", x = 2, y = 0.4, label = "Spearman correlation\n r=-0.89 \n p=5.42e-4", size = 5, color = "black", hjust = 0)
  
  
  
  dev.off()