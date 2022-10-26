
library(rtables)

lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_rows_by("SEX") |>
  analyze("AGE", \(x) rcell("x", format = "xx"))

build_table(lyt, ex_adsl)

# use in_rows instead
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_rows_by("SEX") |>
  analyze("AGE", \(x) in_rows(AGE = "x", .formats = "xx"))

build_table(lyt, ex_adsl)


# now return 2 cells
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_rows_by("SEX") |>
  analyze("AGE", \(x) in_rows(X = "x", Y = "y", .formats = c("xx", "xx")))

build_table(lyt, ex_adsl)


# now with the facet data
my_afun = function(x) {
  in_rows(
    .list = list(
      "Mean" = mean(x),
      "Var" = var(x)
    ),
    .formats = c("Mean" = "xx.x", "Var" = "xx.xx")
  )
}

lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_rows_by("SEX") |>
  analyze("AGE", my_afun, show_labels = "visible")

build_table(lyt, ex_adsl)


# which works for multiple variables as well
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_rows_by("SEX") |>
  analyze(c("AGE", "BMRKR1"), my_afun, show_labels = "visible")

build_table(lyt, ex_adsl)


# if x is not enough then use df as an argument to afun
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_rows_by("SEX") |>
  analyze(c("AGE", "BMRKR1"), \(df) rcell(nrow(df), format = "xx"), show_labels = "visible")

build_table(lyt, ex_adsl)

# lets do something more advanced

my_afun2 <- function(df) {
  slope <- if (nrow(df) > 3) {
    fit <- lm(AGE ~ BMRKR1, data = df)
    rcell(coefficients(fit)[2], format = "xx.xx")
  } else {
    rcell("-")
  }
  
  in_rows(
    "slope (AGE ~ BMRKR1)" = slope
  )
}

my_afun2(ex_adsl)

lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_rows_by("SEX") |>
  analyze("USUBJID", my_afun2, show_labels = "hidden")

build_table(lyt, ex_adsl)
