# browser data

library(dplyr)
library(dotenv)
load_dot_env()
setwd(Sys.getenv("WORKING_DIRECTORY"))

browser_data <-read.csv('data/covid-re_alldomains_browsers')

browser_data$visit_date <- as.Date(browser_data$visit_date, "%Y-%m-%d")

browser_data <- browser_data %>% rename(browser = which_browser)

browser <- unique(browser_data$browser)

# split the data up into the devices
chrome_data <- browser_data[grep("Chrome",browser_data$browser),]
inex_data <- browser_data[grep("Internet Explorer|Edge",browser_data$browser),]
safari_data <- browser_data[grep("Safari|Safari (in-app)",browser_data$browser),]
other_data <- browser_data[-grep("Safari|Safari (in-app)|Internet Explorer|Edge|Chrome",browser_data$browser),]

# drop the browserui_
drop <- c("browser")
chrome_vec1 = chrome_data[,!(names(chrome_data) %in% drop)]
inex_vec1 = inex_data[,!(names(inex_data) %in% drop)]
safari_vec1 = safari_data[,!(names(safari_data) %in% drop)]
other_vec1 = other_data[,!(names(other_data) %in% drop)]

#sum by dates so you end up with 365 days
chrome_vec2 = aggregate(chrome_vec1['total_visits'], by=chrome_vec1['visit_date'], sum)
inex_vec2 = aggregate(inex_vec1['total_visits'], by=inex_vec1['visit_date'], sum)
safari_vec2 = aggregate(safari_vec1['total_visits'], by=safari_vec1['visit_date'], sum)
other_vec2 = aggregate(other_vec1['total_visits'], by=other_vec1['visit_date'], sum)

# drop the browser
drop <- c("visit_date")
#firefox_vec1 = firefox_data[,!(names(firefox_data) %in% drop)]
chrome_vec3 = chrome_vec2
chrome_vec3$total_visits = chrome_vec3$total_visits
inex_vec3 = inex_vec2[,!(names(inex_vec2) %in% drop)]
safari_vec3 = safari_vec2[,!(names(safari_vec2) %in% drop)]
other_vec3 = other_vec2[,!(names(other_vec2) %in% drop)]
total_vec = chrome_vec3$total_visits +inex_vec3 + safari_vec3 + other_vec3

# create a new dataframe
df <-data.frame(visit_date = chrome_vec3$visit_date,
                chrome = chrome_vec3$total_visits/total_vec*100,
                inex = inex_vec3/total_vec*100,
                safari = safari_vec3/total_vec*100,
                other = other_vec3/total_vec*100)
colors <- c("Chrome" = "cyan3", 
            "Internet Explorer" = "deepskyblue4",
            "Safari" = "brown3",
            "Other" = "darkorchid4")

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

window = 6
df$chrome <- rolling_average(df$chrome,window)
df$inex <- rolling_average(df$inex,window)
df$safari <- rolling_average(df$safari,window)
df$other <- rolling_average(df$other,window)

#use function to find the rolling mean for ratios
ratios$rolling_ratios <- rolling_average(ratios$ratio_data,6)

library(ggplot2)
h<-ggplot(df,aes(x = visit_date)) + 
  geom_line(aes(y = chrome,color="Chrome"), size = 0.5)+
  geom_line(aes(y = inex,color="Internet Explorer"), size = 0.5) +
  geom_line(aes(y = safari,color="Safari"), size = 0.5) +
  geom_line(aes(y = other,color="Other"), size = 0.5) +
  ggtitle('Different browsers for users of all government websites') +
  scale_y_continuous(minor_breaks = seq(0, 5000, 500)) +
  scale_x_date(date_breaks = "3 months", date_minor_breaks = "1 month",
               date_labels = "%B") +
  labs(x="Date", 
       y = "Percentage of number of daily visits for different browsers",
       color = "",
       subtitle = "Percentage by browser for all government domains",
       caption = "Data source: DTA GA360") +
  scale_color_manual(values = colors) +
  theme_minimal() + #theme_classic() +
  theme(legend.position = "bottom")

h