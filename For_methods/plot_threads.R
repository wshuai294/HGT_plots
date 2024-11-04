library(ggplot2)

df<-read.table("For_methods/time_threads.csv", sep=",", header=TRUE)


pdf(file="time_threads.pdf", width=5, height=5, onefile=FALSE)
ggplot(data=df, aes(x=threads, y=time, color='#999999')) +
  geom_line()+
  geom_point()+
  labs(x="N.O. of threads", y = "wall clock time (h)")+
  theme(legend.position = "none")

dev.off()