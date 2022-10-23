
library(ggplot2)

ggplot(ex_adsl, mapping = aes(x = AGE)) +
  geom_histogram() +
  facet_grid(cols = vars(ARM))


library(rtables)

lyt <- basic_table() |>
  split_cols_by("ARM") |>
  analyze("AGE", range, format = "xx.xx - xx.xx")

build_table(lyt, ex_adsl)

