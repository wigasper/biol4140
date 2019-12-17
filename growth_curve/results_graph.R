library(ggplot2)

data <- read.csv("results2.csv")

tiff("results_graph.tiff", units="in", width=5, height=4, res=300)
p <- ggplot(data, aes(x=time, y=num, color=cells)) + geom_point(alpha=.7)
p <- p + labs(title="", x="Time (Days)", y="Total Cells") + geom_line(aes(color=cells), alpha=.8)
p <- p + scale_y_log10(breaks = scales::trans_breaks("log10", function(x) 10^x),
                       labels = scales::trans_format("log10", scales::math_format(10^.x)))
p <- p + annotation_logticks(sides = "l")
p + scale_color_discrete(name="Seed Volume", breaks=c("u200", "u500"), labels=c(expression("200"*mu*"L"), expression("500"*mu*"L")))
dev.off()
