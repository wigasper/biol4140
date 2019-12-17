library(ggplot2)

data <- read.csv("parsed_uncooked_results.csv")
p <- ggplot(data, aes(val)) + geom_density()
p
kruskal.test(val~group, data=data)


data <- read.csv("parsed_cooked_results.csv")
p <- ggplot(data, aes(val)) + geom_density()
p
kruskal.test(val~group, data=data)
