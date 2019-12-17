data <- read.csv("dmso_comp.csv")

data$val <- data$val * 100

p <- ggplot(data, aes(x=factor(treat), y=val, fill=factor(treat))) 
p <- p + geom_boxplot(outlier.size=5, notch=FALSE, varwidth=TRUE)
p

tiff("dmso_density_plot.tiff", units="in", width=5, height=4, res=300)
p2 <- ggplot(data, aes(val, alpha=.5)) + geom_density(color="DodgerBlue", fill="DodgerBlue3", alpha=.5)
p2 <- p2 + coord_cartesian(xlim=c(-12,22))
p2 + labs(x="Normalized Relative Fluorescence (%)", y="Density")
dev.off()