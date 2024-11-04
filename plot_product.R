library(ggplot2)
require(gridExtra)
library(dplyr) 
library(ggpubr)


dat<-read.table("product_count_Lachnospiraceae.csv", sep = "\t", header=TRUE)
dat$Product <- factor(dat$Product, levels = dat$Product[order(dat$Count)])
dat <- dat[3:45,]
pdf(file="product_count.pdf", width=10, height=6)




ggplot(data=dat, aes(x=Product, y=Count)) +
    geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.4) +
    coord_flip() +
    xlab("Product") +
    ylab("N.O. of genes") +
    theme_bw()+ theme(panel.border = element_blank())



dev.off()
