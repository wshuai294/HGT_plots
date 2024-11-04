df<-read.table("lachnospiraceae_diff_HGTs.csv", sep=",", header=TRUE)

df$Events <- df$Events/df$Bases

p1 <- ggboxplot(filter(df, Cohort=="YachidaS_2019"), x = "Group", y = "Events",
                color = "Group", palette = c("slateblue1" , "tomato"), add="mean")+
  ylab("Events")+
  stat_compare_means(aes(group = Group), label = "p.format", method = "wilcox.test")+
  grids(linetype = "dashed")+
  xlab("YachidaS_2019")

# p1 <- ggboxplot(filter(df, Cohort!="WirbelJ_2018"), x = "Group", y = "Events",
#                 color = "Group", palette = c("slateblue1" , "tomato"), add="mean")+
#   ylab("Events")+
#   stat_compare_means(aes(group = Group), label = "p.format", method = "wilcox.test")+
#   grids(linetype = "dashed")+
#   xlab("YachidaS_2019")

p1