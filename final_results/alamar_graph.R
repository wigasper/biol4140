library(ggplot2)

data <- read.csv("results.csv")

tiff("results_graph.tiff", units="in", width=6, height=4, res=300)
p <- ggplot(data, aes(x=curc, y=fluor)) + geom_point(aes(color=factor(treat)), alpha=.7)
p <- p + labs(title="", x=expression("Curcumin Concentration ("*mu*"M)"), y="Relative Fluorescence (%)") + geom_line(aes(color=factor(treat)), alpha=.8)
#p <- p + coord_cartesian(ylim=c(0,100)) #+ scale_x_continuous(trans="log10", limits=c(NA,NA))
p <- p + geom_errorbar(aes(ymin=fluor-stderr, ymax=fluor+stderr, color=factor(treat)), alpha=.7, width=.05, position=position_dodge(0.05))
p + scale_color_discrete(name="Treatment", breaks=c("c", "u"), labels=c("Cooked", "Uncooked"))
dev.off()

