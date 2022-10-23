
library(rtables)

# TODO

a_count_percentage3 <- function(x, .Ncol, denom = c("N", "n")) {
  
  # add referential footer
  
}

lyt <- basic_table(
  title = ,
  subtitles = c(),
  main_footer = (),
  prov_footer = 
) |>
  split_cols_by("ARM") |>
  analyze(c("RACE", "SEX", a_count_percentage3))

build_table(lyt, ex_adsl)
