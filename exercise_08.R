
library(ggplot2)

ex_adsl |>
  ggplot(ex_adsl, mapping = aes(x = AGE)) +
  geom_histogram() +
  facet_grid(cols = vars(ARM))
