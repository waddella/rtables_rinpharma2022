
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
a_summary2(ex_adsl$AGE)


a_freq_table <- function(x) {
  in_rows(.list = as.list(table(x)))
}
a_freq_table(ex_adsl$COUNTRY)


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
  analyze("SEX", a_freq_table)

build_table(lyt, ex_adsl)

# analyze on multiple variables
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  analyze(c("AGE", "BMRKR1"), a_summary2) |>
  analyze("SEX", a_freq_table)

build_table(lyt, ex_adsl)


# in fact afun can also be a list of functions (one per variable)
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  analyze(vars = c("AGE", "BMRKR1", "SEX"),
          afun = list(a_summary2, a_summary2, a_freq_table))

build_table(lyt, ex_adsl)

# analyze dispatch on variable type
a_summary3 <- function(x) {
  if (is.factor(x)) {
    a_freq_table(x)
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