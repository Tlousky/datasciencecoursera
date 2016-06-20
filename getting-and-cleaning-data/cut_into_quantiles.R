ApplyQuintiles <- function(x) {
    cut(x, breaks=c(quantile(mgrp$idx, probs = seq(0, 1, by = 0.20))), 
        labels=c("0-20","20-40","40-60","60-80","80-100"), include.lowest=TRUE)
}
mgrp$Q <- sapply(mgrp$idx, ApplyQuintiles)
