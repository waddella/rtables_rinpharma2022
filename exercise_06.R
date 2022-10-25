
library(rtables)

df <- data.frame(
  ARM = factor(c("A", "B", "A"), levels = c("A", "B", "C")),
  AGE = c(21, 23, 14)
)

is.factor(df$ARM)

levels(df$ARM)

lyt <- basic_table() |>
  split_cols_by("ARM") |>
  analyze("AGE", mean, format = "xx.xx")

tbl <- build_table(lyt, df)
print(tbl)
# note rtables keeps all levels by default
# this is standard behavior, e.g.
tapply(df$AGE, df$ARM, mean)


# To drop the levels with no observations use
# split functions
lyt2 <- basic_table() |>
  split_cols_by("ARM", split_fun = drop_split_levels) |>
  analyze("AGE", mean, format = "xx.xx")

tbl <- build_table(lyt2, df)
print(tbl)

# reorder columns
library(forcats)
library(dplyr)

df <- df |>
  mutate(ARM = fct_relevel(ARM, "B", "A"))

lyt3 <- basic_table() |>
  split_cols_by("ARM", split_fun = drop_split_levels) |>
  analyze("AGE", mean, format = "xx.xx")

tbl <- build_table(lyt2, df)
print(tbl)

