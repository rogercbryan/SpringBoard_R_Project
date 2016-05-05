# Description of Data
# VARIABLE DESCRIPTIONS:
#  survival        Survival
#  (0 = No; 1 = Yes)
# pclass          Passenger Class
# (1 = 1st; 2 = 2nd; 3 = 3rd)
# name            Name
# sex             Sex
# age             Age
# sibsp           Number of Siblings/Spouses Aboard
# parch           Number of Parents/Children Aboard
# ticket          Ticket Number
# fare            Passenger Fare
# cabin           Cabin
# embarked        Port of Embarkation
# (C = Cherbourg; Q = Queenstown; S = Southampton)
# SPECIAL NOTES:
#   Pclass is a proxy for socio-economic status (SES)
# 1st ~ Upper; 2nd ~ Middle; 3rd ~ Lower
# Age is in Years; Fractional if Age less than One (1)
# If the Age is Estimated, it is in the form xx.5
# 
# With respect to the family relation variables (i.e. sibsp and parch)
# some relations were ignored.  The following are the definitions used
# for sibsp and parch.
# Sibling:  Brother, Sister, Stepbrother, or Stepsister of Passenger Aboard Titanic
# Spouse:   Husband or Wife of Passenger Aboard Titanic (Mistresses and Fiances Ignored)
# Parent:   Mother or Father of Passenger Aboard Titanic
# Child:    Son, Daughter, Stepson, or Stepdaughter of Passenger Aboard Titanic
# Other family relatives excluded from this study include cousins,
# nephews/nieces, aunts/uncles, and in-laws.  Some children travelled
# only with a nanny, therefore parch=0 for them.  As well, some
# travelled with very close friends or neighbors in a village, however,
# the definitions do not support such relations.

titanic.data <- read.csv("titanic_original.csv", stringsAsFactors = FALSE)
str(titanic.data)
titanic.data$embarked
# The embarked column has one missing value, which is known to correspond to a passenger who actually embarked at Southampton. 
# Find the missing value and replace it with S.
titanic.data$embarked[[285]]

# which embarked are missing variables
missing_embarked <- which(titanic.data$embarked == "")
titanic.data$embarked[missing_embarked] <- "S"

# find the mean of age
# issue is that NA is causing the mean to be NA
mean(titanic.data$age, na.rm = TRUE)

# summary is a generic function not the exact value
summary(titanic.data$age)
is.na(titanic.data$age)

# How do you calculate the mean without looking at the NA
# http://stackoverflow.com/questions/6148374/r-mean-when-conditions-got-na
mean(titanic.data$age, na.rm = TRUE)
# I chose this version because it worked

# assign NA to missing boat numbers
missing_boat <- which(titanic.data$boat == "")
titanic.data$boat[missing_boat] <- NA

# create a new column has_cabin_number which has 1 if there is a cabin number, and 0 otherwise
# special value "NA" - is just letters |  vs string value NA - True NA (Not Available)
# is.na(NA) = TRUE | is.na("NA") = FALSE

titanic.data$has_cabin_number <- ifelse(titanic.data$cabin == "", 0, 1) 
View(titanic.data)
write.csv(titanic.data, "titanic_clean.csv")