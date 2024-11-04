library(ggplot2)



df2<-read.table("for_AUC_plot.csv", header=TRUE)
head(df2)

df2$Group <- factor(df2$Group, levels = rev(levels(df2$Group)))
pdf("auc_bar.pdf", width=5.4, height=4)
# Change the colors manually
p <- ggplot(data=df2, aes(x=Cohort, y=AUC, fill=Group)) +
  geom_bar(width=0.7, stat="identity", color="black", position=position_dodge())+
  theme_classic()+
  scale_x_discrete(guide = guide_axis(angle = 30))+
  coord_cartesian(ylim=c(0.7,1))+
  theme(legend.position = "top", axis.text.x = element_text(size = 12))+xlab("")
# Use custom colors
# p + scale_fill_manual(values=c('#999999','#E69F00'))
#p + scale_fill_manual(values=c('#1B9E77', '#D95F02'))
p + scale_fill_manual(values=c("slateblue1" , "tomato"))

# Use brewer color palettes
# p + scale_fill_brewer(palette="Blues")


dev.off()