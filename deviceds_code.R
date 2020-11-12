# devices data
# devices_data2.csv is the one for australia.gov.au
library(ggplot2)
library(dotenv)
load_dot_env()
setwd(Sys.getenv("WORKING_DIRECTORY"))

devices_data <-read.csv('data/alldomains_device_data.csv')

devices_data$visit_date <- as.Date(devices_data$visit_date, "%Y-%m-%d")

# split the data up into the devices
tablet_data <- devices_data[grep("tablet",devices_data$which_device),]
mobile_data <- devices_data[grep("mobile",devices_data$which_device),]
desktop_data <- devices_data[grep("desktop",devices_data$which_device),]

# drop the device name and date
drop <- c("visit_date","which_device")
tablet_vec = tablet_data[,!(names(tablet_data) %in% drop)]/1000000
mobile_vec = mobile_data[,!(names(mobile_data) %in% drop)]/1000000
desktop_vec = desktop_data[,!(names(desktop_data) %in% drop)]/1000000

# create a new dataframe
df <-data.frame(tablet_data$visit_date,tablet_vec,mobile_vec,desktop_vec)
colors <- c("Tablet" = "seagreen4", "Mobile" = "darkorange2", "Desktop" = "mediumpurple3")

# make the graph
h<-ggplot(df,aes(x=tablet_data.visit_date)) + 
  geom_line(aes(y = tablet_vec,color="Tablet"), size = 0.5)+
  geom_line(aes(y = mobile_vec,color="Mobile"), size = 0.5)+
  geom_line(aes(y = desktop_vec,color="Desktop"), size = 0.5) +
  ggtitle('Device Category for users of government websites') +
  scale_y_continuous(minor_breaks = seq(0, 7000, 1000)) +
  scale_x_date(date_breaks = "3 months", date_minor_breaks = "1 month",
               date_labels = "%B") +
  labs(x="Date", 
       y = "Number of daily visits for device (millions)",
       color = "Legend",
       subtitle = "Total daily visits by device for all government domains",
       caption = "Data source: DTA GA360") +
  scale_color_manual(values = colors) +
  theme_minimal() + #theme_classic() +
  theme(legend.position = "bottom")
  
h