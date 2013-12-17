# Find the mean of each group
library(plyr)
cdf <- ddply(df, "cond", summarise, rating.mean=mean(rating))
# cond rating.mean
#    A -0.05775928
#    B  0.87324927

# Overlaid histograms with means
ggplot(df, aes(x=rating, fill=cond)) +
    geom_histogram(binwidth=.5, alpha=.5, position="identity") +
    geom_vline(data=cdf, aes(xintercept=rating.mean,  colour=cond),
               linetype="dashed", size=1)

# Density plots with means
ggplot(df, aes(x=rating, colour=cond)) + geom_density() +
    geom_vline(data=cdf, aes(xintercept=rating.mean,  colour=cond),
               linetype="dashed", size=1)
