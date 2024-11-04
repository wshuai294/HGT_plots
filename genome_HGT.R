library(gggenomes)
palette(rainbow())

pdf("HGT_illustration.pdf", width=12, height=6)


l0<-read.table("links.csv", sep="\t", header=TRUE)
s0<-read.table("seqs.csv", sep="\t", header=TRUE)
g0<-read.table("feats.csv", sep="\t", header=TRUE)
p <- gggenomes(genes=g0, seqs=s0, links=l0)
p + 
  geom_seq() +         # draw contig/chromosome lines
    # label each sequence geom_seq_label() + 
  geom_gene(aes(fill=name)) +        # draw genes as arrow "tomato"
  geom_link(offset = 0.05, color="lightblue") +         # draw some connections between syntenic regions
  geom_gene_tag(aes(label=name), nudge_y=0.1, check_overlap = TRUE) +
  theme(legend.position="none") +
  geom_bin_label(size=2)


dev.off()

