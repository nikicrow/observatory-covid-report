# Australian city data

# locations that users were coming from - now lets try cum sum over 12 months

library(ggplot2)
library(lubridate)
library(dplyr)
library(dotenv)
load_dot_env()
setwd(Sys.getenv("WORKING_DIRECTORY"))

# alldomains_states_data.csv

states_data <- read.csv('data/alldomains_states_data.csv')
states_data$visit_date <- as.Date(states_data$visit_date, "%Y-%m-%d")

# clean up the (not set) ones and the jervis bay ones
states_data <- states_data[-grep("(not set)",states_data$region),]
states_data <- states_data[-grep("Jervis Bay Territory",states_data$region),]

# set unique states
states <- unique(states_data$region)

# record the populations to later scale the states data by population
populations <- list("New South Wales" = 7317500,
                    "Queensland" = 4599400,
                    "South Australia" = 1659800,
                    "Northern Territory" = 231200,
                    "Victoria" = 5640900,
                    "Tasmania" = 511000,
                    "Western Australia" = 2366900,
                    "Australian Capital Territory" = 366900)

### Generalised data frame process to prep for graphs
# create an empty data frame
rows_df <- data.frame(matrix(ncol = 3,nrow = 0))
colnames(rows_df) <- c("total_visits","region","visit_date") # update this to have the same names as the data loaded

# for each state lets clean the data up and add it to the empty data frame
for(i in states){
  # split data into states
  current_vector = states_data[grep(i,states_data$region),]
  # find relevant number to divide visits by
  states_pop <- populations[[i]]
  current_vector$total_visits <- current_vector$total_visits/states_pop*100
  # reinsert state name
  current_vector$state_name <- rep(i,nrow(current_vector))
  # add to rows_df
  rows_df <- rbind(rows_df, current_vector)
}

# scale to millions
rows_df$total_visits <- rows_df$total_visits

# now lets make the graph
g <- ggplot(rows_df, aes(x=visit_date, y=total_visits, colour=state_name)) +
  geom_line() + 
  theme_minimal() +
  ggtitle('Total daily users by state') +
  scale_y_continuous(minor_breaks = seq(0, 3500000, 500000)) +
  scale_x_date(date_breaks = "3 months", date_minor_breaks = "1 month",
               date_labels = "%B") +
  labs(x="Date", 
       y = "Number of daily visits for different states",
       color = "",
       subtitle = "For all government domains*",
       caption = "Data source: DTA GA360") 

library(plotly)
ggplotly(g)
