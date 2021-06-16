# load up the packages
source(here::here("R/package-loading.R"))

# briefly glimpse content of dataset
glimpse(NHANES)

#check out colnames
colnames(NHANES)

#Look at contents
str(NHANES)
glimpse(NHANES)

#see summary
summary(NHANES)

#select one column by its name
select(NHANES, Age)

#select more columns
select(NHANES, Age, Weight, BMI)

#Exclude a column
select(NHANES, -HeadCirc)

#select all columns starting with "BP"
select(NHANES, starts_with("BP"))

#select all columns ending with "day"
select(NHANES, ends_with("day"))

#selects all columns that contain "age"
select(NHANES,    contains("age"))

# save the selected clumns as a new data frame
nhanes_small <-
    select(
        NHANES,
        Age,
        Gender,
        Height,
        Weight,
        BMI,
        Diabetes,
        DiabetesAge,
        PhysActiveDays,
        PhysActive,
        TotChol,
        BPSysAve,
        BPDiaAve,
        SmokeNow,
        Poverty
    )

#view the dataframe
nhanes_small

#renaming as snake case
nhanes_small <- rename_with(nhanes_small, snakecase::to_snake_case)

nhanes_small

# Renaming specific columns
rename(nhanes_small, sex = gender)

nhanes_small

nhanes_small <- rename(nhanes_small, sex = gender)
nhanes_small

## the pipe operator

# without the pipe operator
colnames(nhanes_small)

nhanes_small %>% colnames()

nhanes_small %>%
    select(phys_active) %>%
    rename(physical_activity = phys_active)

# exercise
nhanes_small %>% select(tot_chol, bp_sys_ave, poverty)

nhanes_small %>% rename(diabetes_diagnosis_age = diabetes_age)

nhanes_small %>% select(bmi, contains("age"))

nhanes_small %>% select(phys_active_days, phys_active) %>% rename(days_phys_active = phys_active_days)
