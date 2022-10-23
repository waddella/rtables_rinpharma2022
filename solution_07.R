
library(rtables)

lyt <- basic_table()

lyt

tbl <- build_table(lyt, df = ex_adsl)
print(tbl)
