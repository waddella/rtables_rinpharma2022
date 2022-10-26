
library(formatters) # rtables depends on formatters

data(package = "formatters")

View(ex_adsl)

names(ex_adsl)
var_labels(ex_adsl)


## modify variable lables
ex_adsl2 <- ex_adsl

var_labels(ex_adsl2) <- tolower(var_labels(ex_adsl2))

View(ex_adsl2)

## Other synthetic data
View(ex_adae)
