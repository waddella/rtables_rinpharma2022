source("exercise_02.R")

print(tbl) # should print the demographic table from exercise 02


ptbls <- paginate_table(tbl, page_type = "a4", font_size = 8)

ptbls

ptbls2 <- paginate_table(tbl, page_type = "a4", font_size = 8 , landscape = TRUE)

ptbls2

