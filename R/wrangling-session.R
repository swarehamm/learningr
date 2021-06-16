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


#Filtering
#participants who are female
nhanes_small %>%
    filter(sex == "female")
#participants who are not female
nhanes_small %>%
    filter(sex !=="female")
#Participants who have a BMI equal to 25
nhanes_small %>%
    filter(bmi == 25)

#Participants who have a BMI greater than and equal to 25
nhanes_small %>%
    filter(bmi >= 25)

nhanes_small %>%
    filter(bmi > 25 & sex == "female")
nhanes_small %>%
    filter(bmi> 25 | sex == "female")

##Arranging data
#arrange by age
nhanes_small %>%
    arrange(age)
#arrange by sex in ascending order
nhanes_small %>%
    arrange(sex)
#arrange by sex in descending order
nhanes_small %>%
    arrange(desc(age))
#arrange by sex and then by age
nhanes_small %>%
    arrange(sex, age)

##Transform data
#transform height values to meters
nhanes_small %>%
    mutate(height = height/100)

#add a new column with logged height values
nhanes_small %>%
    mutate(logged_height = log(height))
nhanes_small %>%
    mutate(height = height/100,
           logged_height = log(height))
#new column based on how active people are
nhanes_small %>%
    mutate(highly_active = if_else(phys_active_days >= 5, "Yes", "No"))

nhanes_update <- nhanes_small %>%
    mutate(height = height/100,
           logged_height = log(height),
           highly_active = if_else(phys_active_days >= 5, "Yes", "No"))

##Summary statistics by group
nhanes_small %>%
    summarise(max_bmi = max(bmi))
nhanes_small %>%
    summarise(max:bmi = max(bmi, na.rm = TRUE))

nhanes_small %>%
    summarise(sum_na = sum(isn.na(bmi)))
#calculating two summary statistics
nhanes_small %>%
    summarise(max_bmi = max(bmi, na.rm = TRUE),
              min_bmi = min(bmi, na.rm = TRUE))
