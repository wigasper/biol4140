library(ggplot2)

data <- read.csv("trypan_results.csv")

tiff("trypan_results_graph.tiff", units="in", width=5, height=4, res=300)
p <- ggplot(data, aes(x=curc, y=pct)) + geom_point(color="DodgerBlue3", alpha=.7)
p <- p + labs(title="", x=expression("Curcumin Concentration ("*mu*"M)"), y="Viability Index (%)") #+ geom_line(color="DodgerBlue3", alpha=.8)
#p <- p + geom_errorbar(aes(ymin=fluor-stderr, ymax=fluor+stderr), width=.2, position=position_dodge(0.05))
#p <- p + coord_cartesian(ylim=c(0,100)) + scale_x_log10()
p <- p + coord_cartesian(ylim=c(0,100)) #+ scale_x_continuous(trans="log10", limits=c(NA,NA))
#p + geom_smooth(method=stats::lm(pct ~ curc + I(curc^2), data)) #, level=.95)
p + geom_smooth(method="lm", formula=y ~ poly(x,2) + poly(x,3), data=data, level=.90)
dev.off()

lm.model <- lm(pct ~ poly(curc,2) + poly(curc,3), data)

predict(lm.model, newdata=data.frame(curc=93))

ls.model <- lsfit(curc,)