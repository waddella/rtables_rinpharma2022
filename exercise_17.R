
library(rtables)

# .N_col is a special argument
help(analyze)

a_count_percentage <- function(x, .N_col) {
  n <- sum(!is.na(x))
  counts <- table(x)
  count_percentages <- lapply(counts, \(cnt) rcell(cnt * c(1, 1/.N_col), format = "xx (xx.xx%)"))
  in_rows(.list = append(list("n" = rcell(n, "xx")), count_percentages))
}

lyt <- basic_table(main_footer = "N used as the denominater for percentages") |>
  split_cols_by("ARM") |>
  analyze(c("SEX", "RACE"), afun = a_count_percentage)

build_table(lyt, ex_adsl)


# Exercise:
# create a_count_percentage with the argument denom = c("n", "N") to choose which denominator to use



