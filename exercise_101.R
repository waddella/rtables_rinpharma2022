
library(rtables)

lyt <- basic_table() |>
  analyze("AGE")

build_table(lyt, ex_adsl)


fivenum_afun <- function(x) {
  in_rows(
    "n" = sum(!is.na(x)), 
    "mean (sd)" = c(mean(x), sd(x)), 
    "median" = median(x), 
    "min - max" = range(x),
    .formats = c(
      n = "xx", 
      "mean (sd)" = "xx.x (xx.x)", 
      median = "xx.x", 
      "min - max" = "xx.x - xx.x")
  )
}

lyt2 <- basic_table() |>
  analyze("AGE", fivenum_afun)

build_table(lyt2, ex_adsl)

# note ... vs .list arugment in in_rows
# this is also valid
fivenum_afun <- function(x) {
  in_rows(
    .list = list(
      "n" = sum(!is.na(x)), 
      "mean (sd)" = c(mean(x), sd(x)), 
      "median" = median(x), 
      "min - max" = range(x)
    ),
    .formats = c(
      n = "xx", 
      "mean (sd)" = "xx.x (xx.x)", 
      median = "xx.x", 
      "min - max" = "xx.x - xx.x")
  )
}
