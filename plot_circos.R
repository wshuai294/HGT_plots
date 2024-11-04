library(circlize)
library(dplyr)
require(gridExtra)
library(grid)

pdf(file="my_circos.pdf", width=10, height=10, onefile=FALSE)

df<-read.table("circos_data.csv", sep="\t", header=TRUE)
mat<-read.table("for_heatmap_circos_data.csv", sep="\t", header=TRUE)
his<-read.table("for_hist_circos_data.csv", sep="\t", header=TRUE)
df$freqency <- log(df$freqency)
bed1<-read.table("for_bed1_circos_data.csv", sep="\t", header=TRUE)
bed2<-read.table("for_bed2_circos_data.csv", sep="\t", header=TRUE)

mat<-mat[,-1]
bed1<-bed1[,-1]
bed2<-bed2[,-1]
bed1 <-filter(bed1, support %in% 3:100000) #filter with support number
bed2 <-filter(bed2, support %in% 3:100000)
# df<-df[1:100,]
# mat<-mat[1:100,]

circos.par("track.height" = 0.1)
circos.initialize(df$Genome, x = df$position)

circos.track(df$Genome, y = df$freqency,
             panel.fun = function(position, freqency) {
               circos.text(CELL_META$xcenter, 
                           CELL_META$cell.ylim[2] + mm_y(5), 
                           CELL_META$sector.index,
                           cex=0.5)
               circos.axis(labels.cex = 0.3)
             })

circos.trackPoints(df$Genome, df$position, df$freqency, col = "red", pch = 16, cex = 0.5)
circos.trackHist(his$Genome, his$bkp, bin.size = 50000, bg.col = "white", col = "lightblue")
# 
# 
col_fun = colorRamp2(c(0, 0.125, 0.25, 0.5, 0.75, 1), c("red", "blue", "yellow", "green", "brown", "black"))
circos.genomicHeatmap(mat, col=col_fun, side = "inside", border = "white", connection_height=NULL)

#circos.genomicLink(bed1, bed2, col = rand_color(nrow(bed1), transparency = 0.5), 
#                   border = NA)
circos.genomicLink(bed1, bed2, col = "skyblue", border = NA)

circos.clear()

dev.off()