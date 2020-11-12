# Device operating systems over a year
# 
#select * from dta_customers_ausgov.covid19_traffic_source_accumulated_snapshot_7days_doi;

   select
        COUNT(visits) as total_visits,
        deviceCategory as which_device,
        visit_date, 
   from
   (
   
      # example area for australia.gov.au
      select
            device.deviceCategory,
            totals.visits as visits,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            
            from
              `71597546.ga_sessions_*` AS GA,
              UNNEST(GA.hits) AS hits
            where type = 'PAGE'
            and   totals.visits = 1
            and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())

    )
    GROUP BY visit_date,which_device
    order by visit_date
    ;
   