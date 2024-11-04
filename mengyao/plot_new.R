library(ggsci)
library(chromoMap)


pdf(file="chr6.pdf", width=8, height=4, onefile=FALSE)
#chromoMap(c("chr_file.txt", "chr_file.txt"), c("anno_file1.txt", "anno_file2.txt"), labels=T, ploidy=2, chr_col = c("grey","#5F4368"), data_type = "categorical",data_based_color_map = T, data_colors = list(mypal), label_font=5, chr_text = c(T,F), chr_width=10, chr_length = 10,ch_gap = 5,fixed.window = T, window.size = 100,win.summary.display = T)

#chromoMap(c("chr_file.txt", "chr_file.txt"), c("anno_file1.txt", "anno_file2.txt"), labels=T, ploidy=2, chr_col = c("grey","#5F4368"), data_type = "categorical",data_based_color_map = T, data_colors = list(mypal), label_font=5, chr_text = c(T,F), chr_width=10, chr_length =3, label_angle = -65, ch_gap = 5,fixed.window = T, window.size = 5000,win.summary.display = T)

#chromoMap(c("chr_file.txt", "chr_file.txt"), c("anno_file1.txt", "anno_file2.txt"), labels=T, ploidy=2, chr_col = c("grey","#5F4368"), ch_gap = 5, data_type = "categorical",data_based_color_map = T, data_colors = list(mypal), label_font=5, chr_text = c(T,F),label_angle = -65, window.size = 5000,win.summary.display = T, )

#chromoMap(c("chr_file.txt", "chr_file.txt"), c("anno_file1.txt", "anno_file2.txt"), labels=T, ploidy=2, chr_col = c("grey","#5F4368"), ch_gap = 5, data_type = "categorical",data_based_color_map = T, data_colors = list(mypal), label_font=5, chr_text = c(T,F),label_angle = -65, win.summary.display = T, n_win.factor=3, export.options=T)

#chromoMap(c("chr_file.txt", "chr_file.txt"), c("anno_file1.txt", "anno_file2.txt"), labels=T, ploidy=2, chr_col = c("grey","grey"), ch_gap = 5, data_type = "categorical",data_based_color_map = T, data_colors = list(mypal), label_font=5, chr_text = c(T,F),label_angle = -65, win.summary.display = T, n_win.factor=4, export.options=T, chr_length =2, chr_width=20)

#chromoMap(c("chr_file.txt"), c("anno_file1.txt"), labels=T, ploidy=1, data_type = "categorical")

chromoMap(c("test_chr_chr6.txt"), c("test_anno_chr6.txt"), labels=T, ploidy=1, data_type = "categorical", data_colors = list(mypal), label_font=5, chr_text = c(T,F),label_angle = -65, win.summary.display = T, n_win.factor=4, export.options=T, chr_length =2, chr_width=20)
#chromoMap("test_chr.txt","test_anno.txt")

#chromoMap(c("chr_file_zoom.txt", "chr_file_zoom.txt"), c("anno_file1.txt", "anno_file2.txt"), labels=T, ploidy=2,  chr_col = c("grey","grey"), ch_gap = 5, data_type = "categorical",data_based_color_map = T, label_font=5, chr_text = c(T,F),label_angle = -65, win.summary.display = T, n_win.factor=6, export.options=T,  data_colors = list(mypal2), chr_length =2, chr_width=20)

dev.off()

