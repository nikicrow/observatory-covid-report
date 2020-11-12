# Domains per date
#
# Obviously we want to focus on total users for the domains
# I think total users for domains each day and graphing them over a year might be interesting?
# it is also pro

   select
        COUNT(visits) as total_visits,
        net.reg_domain(hostname) as reg_domain,
        visit_date, 
   from
   (
   
      select
            totals.visits as visits,
            hits.page.hostname as hostname,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
              `71597546.ga_sessions_*` AS GA,
              UNNEST(GA.hits) AS hits
            where type = 'PAGE'
            and   totals.visits = 1
            and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
   
   

    )
    GROUP BY reg_domain, visit_date
    order by visit_date
    ;