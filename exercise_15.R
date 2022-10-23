

library(rtables)

# rcell, format ----
lyt <- basic_table() |>
  analyze("AGE", function(x) {
    rcell(mean(x), format = "xx.xxx")
  })

build_table(lyt, ex_adsl)


# list available formats
list_valid_format_labels()


# multiple values per cell
lyt <- basic_table() |>
  analyze("AGE", function(x) {
    rcell(c(min(x), max(x)), format = "(xx.x, xx.x)")
  })

build_table(lyt, ex_adsl)


# custom formats
lyt <- basic_table() |>
  analyze("AGE", function(x) {
    rcell(list(min(x), max(x)), format = sprintf_format("[%.2f, %.2f]"))
  })

build_table(lyt, ex_adsl)


# in_rows ----
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  analyze("AGE", function(x) {
    x_no_na <- na.omit(x)
    in_rows(
      "n" = length(x_no_na),
      "Mean (SD)" = rcell(c(mean(x_no_na), sd(x_no_na)), format = "xx.xx (xx.xx)"),
      "Median" = rcell(median(x_no_na), format = "xx.x"),
      "Min - Max" = rcell(range(x_no_na), format = "xx.x - xx.x")
    )
  }, show_labels = "visible")

build_table(lyt, ex_adsl)

##  seperate value derivation from formatting
summary2 <- function(x) {
  x_no_na <- na.omit(x)
  list(
    "n" = length(x_no_na),
    "Median (SD)" = c(mean(x_no_na), sd(x_no_na)),
    "Median" = median(x_no_na),
    "Min - Max" = range(x_no_na)
  )
}

summary2(ex_adsl$AGE)

### now markup
a_summary2 <- function(x) {
  y <- summary2(x)
  in_rows(.list = y, .formats = c("xx", "xx.xx (xx.xx)", "xx.x", "xx.x - xx.x"))
}

a_summary2(ex_adsl$AGE)

### use the newly created analysis function
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  analyze("AGE", afun = a_summary2, show_labels = "visible")

build_table(lyt, ex_adsl)

