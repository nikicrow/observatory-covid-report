# domains of interest take 2
library(dplyr)
library(ggplot2)
library(dotenv)
load_dot_env()
setwd(Sys.getenv("WORKING_DIRECTORY"))

# load the data that we got from sql and format dates
dom_data <- read.csv('data/all_domains_and_dates.csv')
dom_data$visit_date <- as.Date(ui_data$visit_date, "%Y-%m-%d")

# find unique domains
domains <- unique(dom_data$reg_domain)

# sum up total visits over the whole year
year_visits <- dom_data %>% 
  group_by(reg_domain) %>% 
  summarize(total_visits=sum(total_visits))

# order by total visits
year_visits <- year_visits[order(year_visits$total_visits),]

# take 10 highest over the year
top10 <- year_visits %>% top_n(10)
top10 <- top10$reg_domain

# create an empty data frame
rows_df <- data.frame(matrix(ncol = 3,nrow = 0))
colnames(rows_df) <- c("total_visits","reg_domain","visit_date")

# for each domain lets clean the data up and add it to the empty data frame
for(current_domain in top10){
  # split data into domains to only add the top10
  current_vector = dom_data[grep(current_domain,dom_data$reg_domain),]
  # add to rows_df
  rows_df <- rbind(rows_df, current_vector)
}

# change the dates to the correct format and the daily visits to 1000s
rows_df$visit_date <-  as.Date(rows_df$visit_date, "%Y-%m-%d")
rows_df$total_visits <- rows_df$total_visits/1000

# now lets make the graph
g <- ggplot(rows_df, aes(x=visit_date, y=total_visits, colour=reg_domain)) +
  geom_line() + 
  theme_minimal() +
  scale_y_continuous(minor_breaks = seq(0, 1500, 125)) +
  scale_x_date(date_breaks = "3 months", date_minor_breaks = "1 month",
               date_labels = "%B") +
  labs(x="Date", 
       y = "Number of daily visits for top10 domains (thousands)",
       color = "Legend",
       subtitle = "Total daily visits by domains*",
       caption = "Data source: DTA GA360") 

g

# make it interactive - note that this makes it lose some prettiness
library(plotly)
ggplotly(g)
