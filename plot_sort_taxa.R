library(ggplot2)
require(gridExtra)


dat<-read.table("taxa_sort.csv", sep = ",", header=TRUE)
dat
dat$Order
dat$The.Number.of.HGT
pdf(file="taxa_sort.pdf", width=15, height=10)
# ggplot(dat, aes(x=dat$Order, y=dat$The.Number.of.HGT)) + 
#   geom_bar(stat = "identity", width=0.2) 

# dat$Order <- factor(dat$Order, levels = dat$Order)
dat$Order <- factor(dat$Order, levels = dat$Order[order(dat$The.Number.of.HGT)])


new_dat<-dat[dat[,"Level"] == 1,]
plot1 <-  ggplot(data=new_dat, aes(x=Order, y=The.Number.of.HGT)) +
  geom_segment( aes(xend=Order, yend=0)) +
  geom_point( size=4, color="orange") +
  coord_flip() +
  theme_bw() +
  xlab("") +
  ylab("Frequency")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+theme_classic()

new_dat<-dat[dat[,"Level"] == 2,]
plot2 <-  ggplot(data=new_dat, aes(x=Order, y=The.Number.of.HGT)) +
  geom_segment( aes(xend=Order, yend=0)) +
  geom_point( size=4, color="red") +
  coord_flip() +
  theme_bw() +
  xlab("") +
  ylab("Frequency")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+theme_classic()


new_dat<-dat[dat[,"Level"] == 3,]
plot3 <-  ggplot(data=new_dat, aes(x=Order, y=The.Number.of.HGT)) +
  geom_segment( aes(xend=Order, yend=0)) +
  geom_point( size=4, color="blue") +
  coord_flip() +
  theme_bw() +
  xlab("") +
  ylab("Frequency")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+theme_classic()


new_dat<-dat[dat[,"Level"] == 4,]
plot4 <-  ggplot(data=new_dat, aes(x=Order, y=The.Number.of.HGT)) +
  geom_segment( aes(xend=Order, yend=0)) +
  geom_point( size=4, color="green") +
  coord_flip() +
  theme_bw() +
  xlab("") +
  ylab("Frequency")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+theme_classic()


new_dat<-dat[dat[,"Level"] == 5,]
plot5 <-  ggplot(data=new_dat, aes(x=Order, y=The.Number.of.HGT)) +
  geom_segment( aes(xend=Order, yend=0)) +
  geom_point( size=4, color="pink") +
  coord_flip() +
  theme_bw() +
  xlab("") +
  ylab("Frequency")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+theme_classic()


new_dat<-dat[dat[,"Level"] == 6,]
plot6 <-  ggplot(data=new_dat, aes(x=Order, y=The.Number.of.HGT)) +
  geom_segment( aes(xend=Order, yend=0)) +
  geom_point( size=4, color="yellow") +
  coord_flip() +
  theme_bw() +
  xlab("") +
  ylab("Frequency")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+theme_classic()



grid.arrange(plot1, plot2, plot3, plot4, plot5, plot6, ncol=3)
dev.off()