library(rworldmap)

pdf("word_map.pdf", width=12, height=8)

d <- data.frame(
  country=c("France", "Germany", "Italy", "China", "Japan", "Austria", "USA", "Taiwan"),
  value=c( 114, 128, 113, 127, 78, 106, 104, 127))

n <- joinCountryData2Map(d, joinCode="NAME", nameJoinColumn="country")
mapParams <- mapCountryData(n, nameColumnToPlot="value", mapTitle="",missingCountryCol="grey", addLegend=FALSE)

           
do.call( addMapLegend, c( mapParams
                          , legendLabels="all"
                          , legendWidth=0.3
                          , horizontal=TRUE
))

dev.off()
