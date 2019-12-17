library(ggplot2)

data <- read.csv("results.csv")

tiff("results_graph.tiff", units="in", width=5, height=4, res=300)
p <- ggplot(data, aes(x=conc, y=fluor)) + geom_point(color="DodgerBlue3", alpha=.7)
p <- p + labs(title="", x=expression("Curcumin Concentration ("*mu*"M)"), y="Relative Fluorescence (%)") + geom_line(color="DodgerBlue3", alpha=.8)
#p <- p + geom_errorbar(aes(ymin=fluor-stderr, ymax=fluor+stderr), width=.2, position=position_dodge(0.05))
#p <- p + coord_cartesian(ylim=c(0,100)) + scale_x_log10()
p <- p + coord_cartesian(ylim=c(0,100)) #+ scale_x_continuous(trans="log10", limits=c(NA,NA))
p <- p + geom_errorbar(aes(ymin=fluor-stderr, ymax=fluor+stderr), color="DodgerBlue3", alpha=.7, width=.05, position=position_dodge(0.05))
p
dev.off()

