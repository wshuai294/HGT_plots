library(ggplot2)

df <- data.frame(Group=c("Thomas-Abun", "Hybrid"),
                 AUC=c(0.85, 0.87))

pdf("CRC_auc_bar_independent.pdf", width=2.2, height=4)
df$Group <- factor(df$Group, levels=c("Thomas-Abun", "Hybrid"))


 p <- ggplot(data=df, aes(x=Group, y=AUC, fill=Group))+
   geom_bar(stat="identity", color="black", position=position_dodge(), width=0.6)+
   theme_classic()+
   scale_x_discrete(guide = guide_axis(angle = 30))+
   coord_cartesian(ylim=c(0.7,0.9))+
   xlab("")+
   theme(legend.position = "none", axis.text.x = element_text(size = 13))+
ggtitle("Independent \n CRC cohort")
 p + scale_fill_manual(values=c("slateblue1" , "tomato"))
dev.off()


# df <- data.frame(Group=c("Thomas-Abun", "Hybrid"),
#                  FPR=c(0.09285714285714286, 0.02857142857142858))
df <- data.frame(Group=c("Thomas-Abun", "Hybrid"),
                 FPR=c(0.09285714285714286, 0.05))

pdf("CRC_auc_bar_independent_T2D.pdf", width=2.2, height=4)
df$Group <- factor(df$Group, levels=c("Thomas-Abun", "Hybrid"))
p <- ggplot(data=df, aes(x=Group, y=FPR, fill=Group))+
  geom_bar(stat="identity", color="black", position=position_dodge(), width=0.6)+
  theme_classic()+
  scale_x_discrete(guide = guide_axis(angle = 30))+
  coord_cartesian(ylim=c(0,0.1))+
  xlab("")+
  theme(legend.position = "none", axis.text.x = element_text(size = 13))+
  ggtitle("T2D cohort")
p + scale_fill_manual(values=c("slateblue1" , "tomato"))  #
dev.off()