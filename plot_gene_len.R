library(ggplot2)
library(plyr)

pdf(file="gene_len.pdf", width=4, height=3)

df<-read.table("gene_len.csv", sep=",", header=TRUE)


# Color by groups
ggplot(df, aes(x=Length)) + 
  geom_histogram(aes(y=..density..), 
                 position="identity", bins=50, color="darkblue", fill="lightblue")+
  geom_density(alpha=.2) +
  xlim(0, 5000)+
  xlab("Transferred Sequence Length (bp)")+
  ylab("Density")+
  theme_classic()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),legend.position = "top")+ geom_vline(aes(xintercept=median(Length)),
                                                                                        color="black", linetype="dashed", size=1)

dev.off()
