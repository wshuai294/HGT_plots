library(circlize)

pdf(file="diff_pair_matrix.pdf", width=7, height=7, onefile=FALSE)

circos.par("canvas.xlim" = c(-1.5, 1.5))

df<-read.table("association/diff_pair_genus_CRC_control.csv", sep=",", header=TRUE)
df$length <- jitter(df$length, amount = 0.05)
circos.initialize(df$genus, xlim = c(0, nrow(df)))

unique_families <- unique(df$family)
# Create a named vector of colors where the names correspond to unique values in the "family" column
family_colors <- setNames(c("#FF0000", "#FF3300", "#FF6600", "#FF9900", "#FFCC00", "#FFFF00", "#CCFF00", "#99FF00", "#66FF00", "#33FF00", "#00FF00", "#00FF33", "#00FF66", "#00FF99", "#00FFCC", "#00FFFF", "#00CCFF", "#0099FF", "#0066FF", "#0033FF", "#0000FF", "#3300FF", "#6600FF", "#9900FF", "#CC00FF", "#FF00FF", "#FF00CC", "#FF0099", "#FF0066", "#FF0033", "#800000", "#804000", "#808000", "#408000", "#008000", "#008040", "#008080", "#004080", "#000080", "#400080", "#800080", "#FF99CC")[1:length(unique_families)], unique_families)


circos.track(df$genus, y = df$length,
             panel.fun = function(position, freqency) {
               circos.text(CELL_META$xcenter, CELL_META$cell.ylim[2] + mm_y(3), CELL_META$sector.index, facing = "clockwise", niceFacing = TRUE, cex=0.5, adj = c(0, 0.5))
               circos.axis(labels.cex = 0.3, labels = FALSE)
             },track.height = 0.1,
             bg.col = family_colors[df$family]
             #,bg.col = adjustcolor(df$color, alpha.f = 0.7),
)

hist<-read.table("association/diff_pair_genus_hist_CRC_control.csv", sep=",", header=TRUE)
#col_fun = colorRamp2(c(1, 10), c("red", "blue"))
# col_fun <- colorRamp2(
#   c(1, 5, 10), 
#   c("#ef8a62", "#f7f7f7", "#67a9cf")
# )
col_fun <- colorRamp2(
  c(min(hist$value1), max(hist$value1)),
  c("#ef8a62", "#67a9cf")
)
circos.genomicHeatmap(hist, col=col_fun, side = "inside", border = "white", connection_height=NULL, heatmap_height = 0.1)

bed1<-read.table("association/diff_pair_genus_bed1_CRC_control.csv", sep=",", header=TRUE)
bed2<-read.table("association/diff_pair_genus_bed2_CRC_control.csv", sep=",", header=TRUE)

bed3<-read.table("association/diff_pair_genus_bed3_CRC_control.csv", sep=",", header=TRUE)
bed4<-read.table("association/diff_pair_genus_bed4_CRC_control.csv", sep=",", header=TRUE)


circos.genomicLink(bed1, bed2, col = "skyblue", border = NA)
circos.genomicLink(bed3, bed4, col = "red", border = NA)

color_palette <- colorRampPalette(c("#ef8a62", "#f7f7f7", "#67a9cf"))
legend_labels <- c("Low", "High")
legend_values <- c(min(hist$value1), median(hist$value1), max(hist$value1))
#legend(x=1, y= 1.3, legend = paste(legend_labels, ": ", legend_values), fill = color_palette(3), bty = "n", title = "N.O. of involved\n genus pair", cex = 0.7)
#legend(x=1, y= 1.3, legend = c("Low", "Medium",  "High"), fill = color_palette(3), bty = "n", title = "N.O. of involved\n genus pair", cex = 0.7)
legend_range <- c(min(hist$value1), max(hist$value1))


legend(x=0.8, y= -1, legend = c("CRC", "control"),
       fill = c("skyblue", "red"), bty = "n", ncol = 1, title = "Enriched genus pair", cex = 0.7) #, cex = 0.7


colorPalette <- colorRampPalette(c("blue", "red"))
# Create the gradient legend
legend("topright", legend = legend_labels, fill = colorPalette(100), 
       title = "N.O. of involved\n genus pair", bty = "n", cex = 0.7)

# Add the gradient color bar
colorbar <- image(legend_range, 1, col = colorPalette(100), 
                  add = TRUE, xlab = "", ylab = "", axes = FALSE)



dev.off()
