library(circlize)
library(ggplot2)
library(dplyr)
require(gridExtra)
library(grid)
library(cowplot)

set.seed(9)

pdf(file="inter_taxa_files/inter_taxa_circles_class.pdf")
dat<-read.table("inter_taxa_files/inter_taxa_class.csv", header=TRUE, check.names = FALSE, sep="\t")
par(cex = 0.5, mar = c(0, 0, 0, 0))
my_tem<-c( "#F7C530", "#95CC5E", "#D0DFE6","pink","#4169E1","#F0DB4F","#226F54","#FF7F50","#FFA500","#6EE2FF","lightgrey")
#my_tem<-c( "#FFA500", "#FF7F50", "#F7C530", "#F0DB4F","#4169E1", "#6EE2FF", "#95CC5E", "#226F54", "pink", "#D0DFE6", "lightgrey")
grid.col <- rep(my_tem, times = 2)[1:11]
#grid.col<-"#6EE2FF"



mat<-as.matrix(dat)
mat <- apply(mat[, -1], 2, as.numeric)
rownames(mat)<-colnames(mat)

cols <- hcl.colors(6, "Temps")

circos.par(cell.padding=c(0,0,0,0), track.margin=c(0,0.05), start.degree = 90, gap.degree =4)
chordDiagram(mat, annotationTrack = "grid", preAllocateTracks = 1, transparency = 0.5,grid.col=grid.col)



circos.trackPlotRegion(track.index = 1, panel.fun = function(x, y) {
  xlim = get.cell.meta.data("xlim")
  ylim = get.cell.meta.data("ylim")
  sector.name = get.cell.meta.data("sector.index")
  circos.text(mean(xlim), ylim[1] + .1, sector.name, facing = "clockwise", niceFacing = TRUE, adj = c(0, 0.5))
  circos.axis(h = "top", labels.cex = 0.5, major.tick.percentage = 0.2, sector.index = sector.name, track.index = 2)
}, bg.border = NA)

text(0, 0, expression(italic("class")), cex = 2, font = 3)

circos.clear()
dev.off()
