library(rtables)

a_summary2 <- function(x) {
  x_no_na <- na.omit(x)
  in_rows(
    "n" = length(x_no_na),
    "Mean (SD)" = rcell(c(mean(x_no_na), sd(x_no_na)), format = "xx.xx (xx.xx)"),
    "Median" = rcell(median(x_no_na), format = "xx.x"),
    "Min - Max" = rcell(range(x_no_na), format = "xx.x - xx.x")
  )
}

a_summary3 <- function(x) {
  if (is.factor(x)) {
    vals <- append(list("n" = sum(!is.na(x))), as.list(table(x)))
    in_rows(.list = vals)
  } else {
    a_summary2(x)
  }
}

lyt <- basic_table() |>
  split_cols_by("ARM") |>
  add_colcounts() |>
  analyze(c("AGE", "BMRKR1", "SEX", "RACE"), a_summary3)

build_table(lyt, ex_adsl)
