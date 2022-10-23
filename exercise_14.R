

library(rtables)

# N = xx
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  add_colcounts() |>
  analyze("AGE", mean, format = "xx.xx")

build_table(lyt, ex_adsl)


# control N values
# this is useful e.g. for adverse events tables build_table(lyt, ADAE, alt_counts_df = ADSL)

alt_adsl <- data.frame(
  ARM = factor(c("A: Drug X", "B: Placebo", "C: Combination", "C: Combination")),
  VAL = c(1, 2, 3, 4)
)

alt_adsl

build_table(lyt, ex_adsl, alt_counts_df = alt_adsl)


# Name vs. labels ----

# TODO Variable names labels

# TODO split names, lables


