library(ggplot2)


df <- read.table("For_methods/pure_donor_comparison.csv",sep=',', header=TRUE)

pdf(file="For_methods/donor.pdf", width=5, height=5)
# df$length<-sapply(df$length, as.factor)
# 
# # ggboxplot(df, x=length, y = "F1.score")
# 
# 
# 
# ggplot(df, aes(x=donor, y=F1, color = Methods, group=donor)) + 
#   geom_boxplot() +
#   scale_color_manual(values = c("slateblue1" , "tomato"))+
#   scale_fill_manual(values = c("slateblue1" , "tomato"))+ 
#   geom_dotplot(binaxis='y', stackdir='center',position=position_dodge(1), binwidth=1/1000)+
#   ylab("F1 score")


# +ylim(0.9, 1)


df <- data.frame(Methods=c("LocalHGT", "LocalHGT", "LEMON", "LEMON"),
                 F1=c(1, 1, 1, 1),
                 donor=c("in", "not_in","in", "not_in")
                 )

p <- ggplot(data=df, aes(x=donor, y=F1, fill=Methods)) +
  geom_bar(stat="identity", color="black", position=position_dodge())+
  theme_minimal()
p + scale_fill_manual(values=c("slateblue1" , "tomato"))+ylab("F1 score")+xlab("Status of donor genomes")


dev.off()