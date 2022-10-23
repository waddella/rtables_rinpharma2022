
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

# sequential analyze calls
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  analyze("AGE", a_summary2) |>
  analyze("BMRKR1", a_summary2)

build_table(lyt, ex_adsl)

# different analysis function
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  analyze("AGE", a_summary2) |>
  analyze("BMRKR1", a_summary2) |>
  analyze("SEX", list_wrap_x(table))

build_table(lyt, ex_adsl)

# analyze on multiple variables
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  analyze(c("AGE", "BMRKR1"), a_summary2) |>
  analyze("SEX", list_wrap_x(table))

build_table(lyt, ex_adsl)

# analyze dispatch on variable type
a_summary3 <- function(x) {
  if (is.factor(x)) {
    in_rows(.list = as.list(table(x)))
  } else {
    a_summary2(x)
  }
}

lyt <- basic_table() |>
  split_cols_by("ARM") |>
  analyze(c("AGE", "BMRKR1", "SEX"), a_summary3)

build_table(lyt, ex_adsl)


# exercise
# add "n" row for factors