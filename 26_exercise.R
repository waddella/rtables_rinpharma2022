
library(rtables)
library(dplyr)

source("21_exercise.R")

ex_adsl_AGEG30 <- ex_adsl |>
  filter(AGE > 30)

tbl_ALL <- build_table(lyt, ex_adsl)

tbl_AGEG30 <- build_table(lyt, ex_adsl_AGEG30)

# . is the same
# X is different
compare_rtables(tbl_ALL, tbl_AGEG30)

Viewer(tbl_ALL, tbl_AGEG30)
