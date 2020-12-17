# user interest code - done by categorising domains into interest
library(dplyr)
library(ggplot2)
#library(dotenv)
#load_dot_env()
#setwd(Sys.getenv("WORKING_DIRECTORY"))

# load the data that we got from sql and create dates
ui_data <- read.csv('~/Documents/COVID_blog2/data/covid-re_new_domains_and_dates')
ui_data$visit_date <- as.Date(ui_data$visit_date, "%Y-%m-%d")

# delete the govcms stuff
ui_data <- ui_data[!grepl("govcms.gov.au",ui_data$reg_domain),]

# load the data that we have in the document with the files and categories
file_cat <- read.csv('~/Documents/COVID_blog2/data/files_and_domains_(copy).csv')

# create a category column
ui_data$Category <- ui_data$reg_domain

# for each search term each day, find the category that we should be in
for (row in 1:nrow(ui_data)){
  ui_data[row,"Category"] <- file_cat[match(ui_data[row,"reg_domain"],file_cat$Domain),]["Category"]
}

# create an empty data frame
rows_df <- data.frame(matrix(ncol = 3,nrow = 0))
colnames(rows_df) <- c("total_visits","visit_date","Category")

# lets make a table with the summarised category data as well
# drop the domains
ui_data <- ui_data[-c(2)]
all_categories <- unique(ui_data$Category)

### NOW WE DO THE GOVCMS STUFF

# load the data that we got from sql and create dates
govcms_data <- read.csv('~/Documents/COVID_blog2/data/covid-re_govcms_filters')
govcms_data$visit_date <- as.Date(govcms_data$visit_date, "%Y-%m-%d")

# load the csv that has the domains and categories for just govcms
gov_cms_categories <- read.csv('~/Documents/COVID_blog2/data/govcms_domains.csv')

# we need to read the data and assign the categories
for (row in 1:nrow(govcms_data)){
  govcms_data[row,"Category"] <- gov_cms_categories[match(govcms_data[row,"reg_domain"],gov_cms_categories$domain_names),]["Category"]
}

# Delete the rows that need to be deleted
govcms_data <- govcms_data[!grepl("Delete",govcms_data$Category),]

# Now we need to sum up all the domains
govcms_data <- subset(govcms_data,select = -c(reg_domain))

### combine the data
ui_data <- rbind(ui_data, govcms_data)

# for each category lets clean the data up and add it to the empty data frame
for(current_cat in all_categories){
  # split data into states
  current_vector = ui_data[grep(current_cat,ui_data$Category),]
  # sum up category data for each date
  cat_vector <- current_vector %>% 
    group_by(visit_date) %>% 
    summarize(total_visits=sum(total_visits))
  # reinsert category name
  cat_vector$cat_name <- rep(current_cat,nrow(cat_vector))
  # add to rows_df
  rows_df <- rbind(rows_df, cat_vector)
}

# change scale of graph
rows_df$total_visits <- rows_df$total_visits/1000 


# create a table in which we will store all the information re the variances
data_summary <- data.frame(matrix(NA,nrow = length(all_categories),ncol=2))
rownames(data_summary) <- all_categories
colnames(data_summary) <- c("trend_strength","seasonal_strength")

# create a table for just the trend lines
trend_lines <- data.frame(matrix(NA,ncol = length(all_categories),nrow = 365))
colnames(trend_lines) <- all_categories
seasonal_lines <- data.frame(matrix(NA,ncol = length(all_categories),nrow = 365))
colnames(seasonal_lines) <- all_categories

for (current_cat in all_categories){
  # lets take out one category at a time and create a vector
  trend_data <- filter(rows_df,grepl(current_cat,rows_df$cat_name))
  trend_data = subset(trend_data, select = -c(cat_name) )
  data_in_vector <- trend_data$total_visits
  
  # Use STL decomposition to seperate the seasonal, trend and random 
  ts_data = ts(data_in_vector[1:365], frequency = 7)
  stl_data = stl(ts_data, "periodic")
  seasonal_stl <- stl_data$time.series[,1]
  trend_stl <- stl_data$time.series[,2]
  random_stl <- stl_data$time.series[,3]
  
  trend_lines[current_cat] <- trend_stl
  #plot(as.ts(trend_stl),main=current_cat)
  
  data_summary[current_cat,'trend_strength'] <- max(0,1-(var(random_stl))/(var(trend_stl+random_stl)))
  data_summary[current_cat,'seasonal_strength'] <- max(0,1-(var(random_stl))/(var(seasonal_stl+random_stl)))
}

# lets take out one category and see if it works
trend_data <- filter(rows_df,grepl('Coronavirus response',rows_df$cat_name))
trend_data = subset(trend_data, select = -c(cat_name) )
data_in_vector <- trend_data$total_visits

### STL Decomposition calculator
# Use STL decomposition to seperate the seasonal, trend and random 
ts_beer = ts(data_in_vector[1:365], frequency = 7)
stl_beer = stl(ts_beer, "periodic")
seasonal_stl_beer   <- stl_beer$time.series[,1]
trend_stl_beer     <- stl_beer$time.series[,2]
random_stl_beer  <- stl_beer$time.series[,3]

plot(ts_beer, ylab="Data",bty="n")
plot(as.ts(seasonal_stl_beer),ylab="Seasonal")
plot(trend_stl_beer,ylab="Trend")
plot(random_stl_beer,ylab="Random")
plot(stl_beer,main="STL Decomposition for Science and Technology",col="dodgerblue3")

### now lets make the graph
# remove the coronavirus response category so that we can see the trend in the other ones more clearly
trend_lines$visit_date <- unique(rows_df$visit_date)[1:365]
library(tidyverse)
trend_lines_long <- trend_lines %>% 
  gather("Science and Technology","Business and Employment","Community Support and Accessibility","Health","Defence Force","Education","Border Control and Immigration","Coronavirus response",key= Category, value = trend_data)
#trend_lines_long <- trend_lines_long[!grepl('Coronavirus response',trend_lines_long$Category),]
g <- ggplot(trend_lines_long, aes(x=visit_date, y=trend_data, colour=Category)) +
  geom_line() + 
  theme_minimal() +
  scale_y_continuous(minor_breaks = seq(0, 4500, 500)) +
  scale_x_date(date_breaks = "3 months", date_minor_breaks = "1 month",
               date_labels = "%B") +
  labs(x="Date", 
       y = "Number of daily visits (thousands)",
       color = "Legend",
       title = "Total daily visits per Category after seasonal adjustment",
       subtitle = "",
       caption = "") 
#
# run till here
g
#
#
library(plotly)
# use this to interact

ggplotly(g)

### ANALYSIS TIME
# analysis of the averages before feb and after may
before_feb_trend <- trend_lines[1:50,]
after_may_trend <- trend_lines[232:365,]
# remove visit dates
before_feb_trend = subset(before_feb_trend,select = -c(visit_date))
after_may_trend = subset(after_may_trend,select = -c(visit_date))
# averages
avg_before_feb <- colMeans(before_feb_trend)
avg_after_may <- colMeans(after_may_trend)
# maximums of each column
colMax <- function(data) sapply(data, max, na.rm = TRUE)
spike_volumes <- colMax(trend_lines)
# create data frame with the info
analysis_trends <- rbind(avg_after_may,avg_before_feb)
analysis_trends <- rbind(analysis_trends, spike_volumes)

analysis_trends <- as.data.frame(t(analysis_trends))
analysis_trends[["percent_before_feb"]] <- analysis_trends[["avg_before_feb"]] / analysis_trends[["spike_volumes"]]
analysis_trends[["percent_after_may"]] <- analysis_trends[["avg_after_may"]] / analysis_trends[["spike_volumes"]]
analysis_trends[["percent_change"]] <- analysis_trends[["percent_after_may"]] / analysis_trends[["percent_before_feb"]]-1
