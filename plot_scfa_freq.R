library(circlize)
library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)
library(ggpubr)


pdf(file="scfa_freq.pdf", width=6, height=8, onefile=FALSE)


df<-read.table("scfa_freq.csv", sep=",", header=TRUE)

df <- arrange(df, desc(fold))
my_order = c("SCFA", "Butyrate", "Butyryl-CoA", "propionate", "Succinate", "Pyruvate", "Acetyl-CoA", "Lactate", "Acetate")
df$scfa <- factor(df$scfa, levels = my_order)
#df <- filter(df, p.adj < 0.05)
ggplot(df,aes(y=fold,x=scfa,fill=log10(p.adj)))+ 
  geom_bar(stat="identity",position = "dodge") +
  scale_fill_gradient(low = "red", high = "blue") +
  theme_bw()+
  coord_flip()+
  xlab("")+
  ylab("Fold Enrichment")+
  #scale_y_continuous(trans='log2')+
  #geom_hline(yintercept = 1, linetype = "dashed") +
  theme(strip.text.y = element_text(angle = 0), legend.position = "bottom", axis.text.y = element_text(size = 15)) +
  geom_text(aes(label=paste("p =", format(p.adj, scientific = TRUE, digits = 3))), 
            position=position_dodge(width=0.9), 
            vjust=0.5,hjust=1.1, size=3, color="white")


# df2<-read.table("scfa_freq.csv", header=TRUE, check.names = FALSE, sep=",")
# # Change the colors manually
# x<-filter(df2, scfa=="scfa" & group=="control")$p.adj
# rounded_x <- format(x, scientific = TRUE, digits = 3)
# text <- paste("p=", rounded_x)
# p <- ggplot(data=filter(df2, scfa=="scfa"), aes(x=group, y=freq, fill=group)) +
#   geom_bar(stat="identity", color="black", position=position_dodge(), width=0.5)+
#   theme_classic()+
#   scale_fill_manual(values=c('#999999','#E69F00'))+
#   xlab("")+
#   annotate("text", x=1, y=0.05, label=text, color="#999999", size=5, hjust=0.5)
# p


dev.off()