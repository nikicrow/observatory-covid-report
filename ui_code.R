# user interest code - done by categorising domains into interest
library(dplyr)
library(ggplot2)
library(dotenv)
load_dot_env()
setwd(Sys.getenv("WORKING_DIRECTORY"))

# load the data that we got from sql and create dates
ui_data <- read.csv('data/all_domains_and_dates.csv')
ui_data$visit_date <- as.Date(ui_data$visit_date, "%Y-%m-%d")

# load the data that we have in the document with the files and categories
file_cat <- read.csv('data/files_and_domains_(copy).csv')

# create a category column
ui_data$category <- ui_data$reg_domain

# for each search term each day, find the category that we should be in
for (row in 1:nrow(ui_data)){
  ui_data[row,"category"] <- file_cat[match(ui_data[row,"reg_domain"],file_cat$Domain),]["Category"]
}

# create an empty data frame
rows_df <- data.frame(matrix(ncol = 3,nrow = 0))
colnames(rows_df) <- c("total_visits","visit_date","category")

# lets make a table with the summarised category data as well
# drop the domains
cat_data <- ui_data[-c(2)]
all_categories <- unique(ui_data$category)

# for each category lets clean the data up and add it to the empty data frame
for(current_cat in all_categories){
  # split data into states
  current_vector = ui_data[grep(current_cat,ui_data$category),]
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

# now lets make the graph
g <- ggplot(rows_df, aes(x=visit_date, y=total_visits, colour=cat_name)) +
  geom_line() + 
  theme_minimal() +
  scale_y_continuous(minor_breaks = seq(0, 1500, 125)) +
  scale_x_date(date_breaks = "3 months", date_minor_breaks = "1 month",
               date_labels = "%B") +
  labs(x="Date", 
       y = "Number of daily visits for topics (thousands)",
       color = "Legend",
       title = "Total daily visits per topic of interest",
       subtitle = "",
       caption = "Data source: DTA GA360") 

# run till here
g


library(plotly)
# use this to interact
ggplotly(g)

