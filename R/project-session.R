source(here::here("R/package-loading.R"))
# Basic of R --------------------------------------------------------------

weight_kilos <- 100
weight_kilos

factor(c("high", "medium", "low"))
# factors are technically numbers that have assigned labels, are used often in models

head(CO2)
colnames(CO2) # column names
str(CO2) # structure
summary(CO2) # much more use

# Object names
day_one
f <- false
dont_assign_function_as_object <- 9

# Spacing
x[, 1]
x[, 1]
mean(x, na.rm = TRUE)
mean(x, na.rm = TRUE)
height <- feet * 12 + inches
df$z
x <- 1:10

# Indenting and brackets
if (y < 0 && debug) {
  message("Y is negative")
}


#control shift a also styles, just like styler: however styler::style_file("~/Desktop/LearningR/project-session.R") is way faster for more files
