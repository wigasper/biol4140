library(ggplot2)

data <- read.csv("results.csv")

tiff("results_graph.tiff", units="in", width=5, height=4, res=300)
p <- ggplot(data, aes(x=Percent.EtOH, y=Percent.Cells)) + geom_point(color="DodgerBlue3", alpha=.8)
p <- p + labs(title="", x="Ethanol (Percent)", y="Viability Index (Percent)") + geom_line(color="DodgerBlue3", alpha=.8)
p
dev.off()

p + geom_smooth(method="loess", level=.95, se=FALSE) + labs(title="", x="Ethanol (Percent)", y="Cell Viability (Percent)")
