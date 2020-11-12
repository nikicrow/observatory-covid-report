# Subcontinents over a year 
#select * from dta_customers_ausgov.covid19_traffic_source_accumulated_snapshot_7days_doi;

   select
        COUNT(visits) as total_visits,
        subContinent,
        visit_date, 
   from
   (
   
     select
            # the domain is australia.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `71597546.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is dta.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `99993137.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is abcc.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `6533313.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is homeaffairs.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `100095673.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is ablis.business.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `78700159.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is abr.business.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `94174429.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is abs.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `73191096.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is aeaguide.education.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `79438793.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is airforce.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `122829809.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is api.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `185106319.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is army.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `122418128.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is australianjobs.employment.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `124827135.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is banknotes.rba.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `203109603.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is beta.abs.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `186366587.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is betterschools.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `63623150.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is business.dmz.development.tga.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `98360372.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is business.dmz.test.tga.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `98362688.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is business.tga.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `98349897.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is catologue.nla.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `6592309.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is cd.defence.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `178909235.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is communitybusinesspartnership.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `95014024.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is consultation.business.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `48099294.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is data.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `69211100.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is data.wgea.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `94241432.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is defence.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `5426088.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is defenceindustry.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `162370350.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is designsystem.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `170387771.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is disabilityadvocacyfinder.dss.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `86149663.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is docs.education.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `77559172.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is dss.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `77084214.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is ebs.tga.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `88992271.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is eduportal.education.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `117867575.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is engage.dss.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `90974611.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is familyrelationships.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `34938005.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is ga.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `80842702.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is govcms.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `134969186.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is govdex.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `77664740.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is guides.dss.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `85844330.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is companioncard.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `31265425.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is formerministers.dss.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `53715324.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is plan4womenssafety.dss.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `104395490.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is serviceproviders.dss.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `101163468.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is humanservices.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `5289745.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is immi.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `100095166.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is immi.homeaffairs.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `177457874.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is industry.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `175671120.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is innovation.govspace.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `69522323.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is intercountryadoption.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `100832347.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is jobaccess.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `104411629.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is joboutlook.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `86630641.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is jobsearch.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `72008433.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is librariesaustralia.nla.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `73966990.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is m.directory.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `70856817.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is marketplace.service.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `130142010.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is minister.defence.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `6059849.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is minister.homeaffairs.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `116763821.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is mychild.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `100180008.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is news.defence.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `135989789.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is nla.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `2802109.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is osb.homeaffairs.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `110162521.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is rba.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `191126238.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is scamwatch.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `103904192.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is superfundlookup.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `94178846.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is tga.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `129200625.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is trove.nla.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `23233927.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is webarchive.nla.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `70635257.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is aqf.edu.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `149444086.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is asbfeo.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `118336527.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is asd.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `121386494.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is business.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `133849100.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is education.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `77562775.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is employment.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `77614012.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is fsc.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `174497994.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is ihpa.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `82020118.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is jobjumpstart.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `111564569.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is learningpotential.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `106413345.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is studentsfirst.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `80703744.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is studyassist.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `53678167.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is tisnational.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `74070468.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             union all
     select
            # the domain is tradesrecognitionaustralia.gov.au
            totals.visits as visits,
            geoNetwork.subContinent,
            date(timestamp_seconds(visitStartTime), 'Australia/Sydney') as visit_date
            from
               `175869519.ga_sessions_*` AS GA,
               UNNEST(GA.hits) AS hits
             where type = 'PAGE'
             and geoNetwork.country <> 'Australia'
             and totals.visits = 1
             and _table_suffix between FORMAT_DATE('%Y%m%d',DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)) and FORMAT_DATE('%Y%m%d',CURRENT_DATE())
             
    )
    GROUP BY visit_date,subContinent
    order by visit_date
    ;