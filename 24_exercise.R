
library(rtables)

source("20_exercise.R")

tbl # adverse events table

row_paths_summary(tbl)

table_structure(tbl)

tbl[c("root", "AEBODSYS", "- Any adverse events - ", "@content"), "root"]
0tbl[1:2, 1:2]
tbl[-(1:2), ] # note indentation

tbl[4, ] # > out of context

#
row_paths(tbl)




