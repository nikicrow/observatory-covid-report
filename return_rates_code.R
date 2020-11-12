# this is the returning users code and data

library(ggplot2)
library(patchwork) #this package is to put two graphs together
library(dotenv)
load_dot_env()
setwd(Sys.getenv("WORKING_DIRECTORY"))

# for just australia.gov.au it is ausgovaunewreturnusers.csv
# for all domains it is alldomains_new_return_data.csv
return_data <-read.csv('data/alldomains_new_return_data.csv')

# delete unnecessary columns
drop <- c("total_visits","total_new_visits")
df = return_data[,!(names(return_data) %in% drop)]

# scale down to millions
df$newUsers = df$newUsers/1000000
df$returningUsers = df$returningUsers/1000000

# Make the date the right data type
df$visit_date <- as.Date(df$visit_date, "%Y-%m-%d")
df<-head(df,-2)

# create a ratio of new to returning users 
ratio_data = df$newUsers/(df$returningUsers+df$newUsers)*100
ratios <- data.frame(df$visit_date, ratio_data)

# create a rolling average function
rolling_average <- function(data, window){
  first_window <- mean(data[1:window])
  new_data <- c()
  for (row in 1:length(data)){
    if (row <= window){
      new_data[row] = first_window
    } else{
      start_row = row - window
      new_data[row] = mean(data[start_row:row])
    }
  }
  return(new_data)
}

# use function to find the rolling mean for ratios
ratios$rolling_ratios <- rolling_average(ratios$ratio_data,6)

# time series with 2 lines - one for new users and one for returning users

colors <- c("New" = "palevioletred2", 
            "Returning" = "cyan3", 
            "New (%)" = "aquamarine4",
            "7 day rolling average" = "deepskyblue4",
            "Safari" = "deepskyblue4",
            "Samsung/Android" = "aquamarine4",
            "Other" = "darkorchid4")

plot1 <- ggplot(df,aes(x=visit_date))+
  geom_line(aes(y=newUsers,color="New"), size = 0.5) +
  geom_line(aes(y=returningUsers,color="Returning"),size = 0.5) +
  ggtitle('New and returning users to Australia.gov.au') +
  scale_y_continuous(minor_breaks = seq(0, 6,1)) +
  scale_x_date(date_breaks = "3 months", date_minor_breaks = "1 month",
               date_labels = "%B") +
  labs(x="Date", 
       y = "Total daily visits (millions)",
       color = "",
       subtitle = "") +
  scale_color_manual(values = colors) +
  theme_minimal() + 
  theme(legend.position = "bottom")


plot2 <- ggplot(ratios,aes(x=df.visit_date)) +
  geom_line(aes(y=ratio_data,color="New"), size = 0.5) +
  geom_line(aes(y=rolling_ratios,color="7 day rolling average"), size = 0.5) +
  labs(x="Date", 
       y = "Percentage of new users (%)",
       color = "") +
  scale_x_date(date_breaks = "3 months", date_minor_breaks = "1 month",
               date_labels = "%B") +
  theme_minimal() +
  scale_color_manual(values = colors) +
  theme(legend.position = "bottom") +
  labs(caption = "Data source: DTA GA360")

plot1/plot2 + plot_layout(heights = c(3,2))

