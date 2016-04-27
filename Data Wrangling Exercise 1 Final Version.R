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

product <-my.data$Product.code...number
product
class(product)
product = as.character(product)

strsplit(product, "-")

splitprod <-strsplit(product, "-")
splitprod

my.data$product_code <-sapply(splitprod, function(x) x[1])
my.data$product_number <-sapply(splitprod, function(x) x[2])

# Assign Product Codes
my.data$product_code[my.data$product_code == "p"] <- "SmartPhone"
my.data$product_code[my.data$product_code == "v"] <- "TV"
my.data$product_code[my.data$product_code == "x"] <- "Laptop"
my.data$product_code[my.data$product_code == "q"] <- "Tablet"

full_address <- paste(my.data$address, my.data$city, my.data$country,sep = ', ')
my.data$company <- company

my.data$company_phillips <- ifelse(company == "phillips", 1, 0)
my.data$company_akzo <- ifelse(company == "akzo", 1, 0)
my.data$company_van_houten <- ifelse(company == "van houten", 1, 0)
my.data$company_unilever <- ifelse(company == "unilever", 1, 0)

my.data$product_smartphone <- ifelse(my.data$product_code == "SmartPhone", 1, 0)
my.data$product_tv <- ifelse(my.data$product_code == "TV", 1, 0)
my.data$product_laptop <- ifelse(my.data$product_code == "Laptop", 1, 0)
my.data$product_tablet <- ifelse(my.data$product_code == "Tablet", 1, 0)

View(my.data)
write.csv(my.data)
write.csv(my.data, "refine_clean.csv")