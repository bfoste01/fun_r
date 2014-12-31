# This is very useful http://stackoverflow.com/questions/15396755/using-loops-with-knitr-to-produce-multiple-pdf-reports-need-a-little-help-to?lq=1
# https://support.rstudio.com/hc/en-us/articles/200552056-Using-Sweave-and-knitr
# input data
Hospital <- c(rep("A", 20), rep("B", 20))
Ward <- rep(c(rep("ICU", 10), rep("Medicine", 10)), 2)
Month <- rep(seq(1:10), 4)
Outcomes <- rnorm(40, 20, 5)
df <- data.frame(Hospital, Ward, Month, Outcomes)

# generate the tex files, one for each hospital in df
library(knitr)
lapply(unique(df$Hospital), function(x) 
       knit("test.rnw", 
            output=paste('report_', x, '.tex', sep="")))

# generate PDFs from the tex files, one for each hospital in df
library(knitr); lapply(unique(df$Hospital), function(x) knit2pdf("test.rnw", output=paste0('report_', x, '.tex')))