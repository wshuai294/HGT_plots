library(ggplot2)
library(ggsci)
library(dplyr)
library(forcats)
library(svglite)

df<-read.table("taxa_sort.csv", sep=",", header=TRUE)
df

df$Taxa <- factor(df$Taxa)
pdf(file="sort_taxa_bar_freq.pdf", width=10, height=5, onefile=FALSE)
# svglite("sort_taxa_bar_freq.svg", width = 10, height = 5)

my_colors<-c('#1B9E77', '#D95F02', '#7570B3', '#E7298A', '#66A61E', '#E6AB02')
my_tem<-rep(my_colors, 6)



# Define the order of the levels
my_order <- c("species", "genus", "family", "order", "class", "phylum")

# Convert the "Level" column to a factor with the specified order
df$Level <- factor(df$Level, levels=rev(my_order))

# Create a bar plot with grouped bars
ggplot(df, aes(x=Level, y=Frequency, fill=fct_inorder(Taxa))) +
  geom_bar(stat="identity", width = 0.7) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5, size=13)) +
  scale_fill_manual(values=my_tem)+
  xlab("")+
  guides(fill = guide_legend(title = "Taxa", ncol = 3, byrow = FALSE))




dev.off()