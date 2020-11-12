# COVID Report 
## The Observatory Team - Digital Transformation Agency
#### The purpose of this analysis is to observe the changes in user behaviour for the past year through coronavirus.

The data is from GA 360 pulled through BigQuery using SQL commands. It is then imported as csv into Python or R for visulation. In this github repo all of the python, R and SQL code is stored.

There are 6 general topics that we looked at are as follows:
1. User interest
This script was used to categorise domains and then to group the data into each category for visulation. 
 - ui_domains_and_dates.sql
 - ui_code.R
 - ui_Coxcomb_nightingale.ipynb
 - top10domains_code.R
2. New and returning users
This script was used to visualise the behaviour of new and returning users to the government domains.
 - new_return.sql
 - new_return_users_streamgraph.ipynb
 - return_rates_code.R
3. Location of users in Australia by state
This script was used to visualise the location of users by state to the government domains.
 - states_data.sql
 - states_code.R
 - states_data_streamgraph.ipynb
4. Locations of users outside of Australia by sub-continent
This script was used to visualise the location of users by sub-continent to the government domains.
 - subcons_data.sql
 - subcon_bar_chart_race.ipynb
 - bcr_subcon_alldom.mp4
5. Browsers 
This script was used to visualise the browsers used for all the government domains.
 - browser.sql
 - browser_code.R
6. Devices
This script was used to visualise the devices used for all the government domains.
 - devices.sql
 - deviceds_code.R


For the final blog check out observatory.gov.au
