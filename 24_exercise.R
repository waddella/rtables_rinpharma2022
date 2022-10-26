
library(rtables)

source("20_exercise.R")

tbl # adverse events table

row_paths_summary(tbl)

table_structure(tbl)

tbl[1, ]
tbl[1:2, 1:2]
tbl[-(1:2), ] # note indentation

tbl[4, ] # > out of context

#
row_paths(tbl)




