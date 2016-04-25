my.data <- read.csv("refine_original.csv", stringAsFactors=FALSE)
str(my.data)
my.data$company
company <-my.data$company
company <-tolower(company)
company <- sub(" ", "", company)
company[company == "akz0"]

# Clean up 'phillips'
company[company == "phlips"] <- "phillips"
company[company == "philips"] <- "phillips"
company[company == "phllips"] <- "phillips"
company[company == "phillps"] <- "phillips"
company[company == "fillips"] <- "phillips"

# Clean up 'unilever'
company[company == "unilver"] <- "unilever"

# Clean up 'akzo'
company[company == "akz0"] <- "akzo"

# Clean up 'van houten'
company[company == "vanhouten"] <- "van houten"

my.data$Product.code...number
product_code <-my.data$Product.code...number

#load packages
library(dplyr)

data(my.data)
head(my.data)

prod.code <- c("p-5",  "p-43", "x-3",  "x-34", "x-12", "p-23")

product <- "p-5"
product <- (strsplit(product, "-"))
product
sapply(product, unique)

product <- "p-5"
product.split <- strsplit(product, "-")
sapply(product.split, unique)

sapply(product, unique)
[prod