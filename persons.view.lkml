view: persons {
  sql_table_name: household_travel_data.persons ;;

  dimension: person_of_household {
    sql: CONCAT(CAST(${TABLE}.HOUSEID AS STRING), '-', CAST(${TABLE}.PERSONID AS STRING)) ;;
    primary_key: yes
  }

  dimension: respondent_of_household {
    sql: CONCAT(CAST(${TABLE}.HOUSEID AS STRING), '-', CAST(${TABLE}.HHRESP AS STRING)) ;;
  }

  dimension: alt_16 {
    label: "Public and/or Rideshare"
    description: "Alternative Mode of Transportation: Public Transportation or Taxi/Rideshare"
    case: {
#       when: {
#         sql: ${TABLE}.alt_16 = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.alt_16 = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.alt_16 = 1 ;;
        label: "Public transportation (bus, subway, light rail, etc.)"
      }
      when: {
        sql: ${TABLE}.alt_16 = 2 ;;
        label: "Taxi (regular taxi, Uber, Lyft, etc.)"
      }
      when: {
        sql: ${TABLE}.alt_16 = 3 ;;
        label: "Public Transportation & Taxi"
      }
      when: {
        sql: ${TABLE}.alt_16 = 4 ;;
        label: "Neither item selected"
      }
      else: "null"

    }
  }

  dimension: alt_23 {
    label: "Family or Friend and/or Rental Car"
    description: "Alternative Mode of Transportation: Passenger to Friend/Family Member or Rental Car"
    case: {
#       when: {
#         sql: ${TABLE}.alt_23 = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.alt_23 = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.alt_23 = 1 ;;
        label: "Get a ride from a friend or family member"
      }
      when: {
        sql: ${TABLE}.alt_23 = 2 ;;
        label: "Rental car (including Zipcar / Car2Go)"
      }
      when: {
        sql: ${TABLE}.alt_23 = 3 ;;
        label: "Friend/Family and Rental Car"
      }
      when: {
        sql: ${TABLE}.alt_23 = 4 ;;
        label: "Neither item selected"
      }
      else: "null"

    }
  }

  dimension: alt_45 {
    label: "Bicycle and/or Walk"
    description: "Alternative Mode of Transportation: Bicycle or Walk"
    case: {
#       when: {
#         sql: ${TABLE}.alt_45 = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.alt_45 = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.alt_45 = 1 ;;
        label: "Bicycle"
      }
      when: {
        sql: ${TABLE}.alt_45 = 2 ;;
        label: "Walk"
      }
      when: {
        sql: ${TABLE}.alt_45 = 3 ;;
        label: "Bicyle and Walking"
      }
      when: {
        sql: ${TABLE}.alt_45 = 4 ;;
        label: "Neither item selected"
      }
      else: "null"

    }
  }

#   dimension: bike4ex {
#     label: "Bike Trips for Exercise"
#     description: "Count of Bike Trips for Exercise"
#     sql: CASE
#             WHEN ${TABLE}.bike4ex = -8 THEN "I don't know"
#             WHEN ${TABLE}.bike4ex = -7 THEN "I prefer not to answer"
#             WHEN ${TABLE}.bike4ex = -1 THEN "Appropriate skip"
#             ELSE CAST(${TABLE}.bike4ex AS STRING) END ;;
#   }
#

#   dimension: bike4ex {
#     label: "Bike Trips for Exercise"
#     description: "Count of Bike Trips for Exercise"
#     sql: CASE
#             WHEN ${TABLE}.bike4ex >= 0 THEN CAST(${TABLE}.bike4ex AS STRING)
#             ELSE null END ;;
#   }

  dimension: bike_dfr {
    label: "Not Biking More: Infrastracture"
    description: "Reason for Not Biking More: Infrastructure"
    case: {
#       when: {
#         sql: ${TABLE}.bike_dfr = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.bike_dfr = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.bike_dfr = 1 ;;
        label: "No nearby paths or trails"
      }
      when: {
        sql: ${TABLE}.bike_dfr = 2 ;;
        label: "No sidewalks or sidewalks are in poor condition"
      }
      when: {
        sql: ${TABLE}.bike_dfr = 3 ;;
        label: "No nearby parks"
      }
      when: {
        sql: ${TABLE}.bike_dfr = 4 ;;
        label: "No nearby paths/trails and poor sidewalks"
      }
      when: {
        sql: ${TABLE}.bike_dfr = 5 ;;
        label: "No nearby paths/trails and no nearby parks"
      }
      when: {
        sql: ${TABLE}.bike_dfr = 6 ;;
        label: "Poor sidewalks and no nearby parks"
      }
      when: {
        sql: ${TABLE}.bike_dfr = 7 ;;
        label: "No nearby paths, paths, and poor sidewalks"
      }
      else: "null"

    }
  }

  dimension: bike_gkp {
    label: "Not Biking More: Safety"
    description: "Reason for Not Biking More: Safety"
    case: {
#       when: {
#         sql: ${TABLE}.bike_gkp = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.bike_gkp = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.bike_gkp = 1 ;;
        label: "No nearby paths or trails"
      }
      when: {
        sql: ${TABLE}.bike_gkp = 2 ;;
        label: "No sidewalks or sidewalks are in poor condition"
      }
      when: {
        sql: ${TABLE}.bike_gkp = 3 ;;
        label: "No nearby parks"
      }
      when: {
        sql: ${TABLE}.bike_gkp = 4 ;;
        label: "No nearby paths/trails and poor sidewalks"
      }
      when: {
        sql: ${TABLE}.bike_gkp = 5 ;;
        label: "No nearby paths/trails and no nearby parks"
      }
      when: {
        sql: ${TABLE}.bike_gkp = 6 ;;
        label: "Poor sidewalks and no nearby parks"
      }
      when: {
        sql: ${TABLE}.bike_gkp = 7 ;;
        label: "No nearby paths, paths, and poor sidewalks"
      }
      else: "null"

    }
  }

  dimension: bikeshare {
    label: "Bike Share Program Usage"
    description: "Count of Bike Share Program Usage"
    sql: CASE
          WHEN ${TABLE}.bikeshare >= 0 THEN CAST(${TABLE}.bikeshare AS STRING)
         ELSE null END ;;
  }

#   dimension: borninus {
#     label: "Born in USA"
#     description: "Born in United States"
#     case: {
# #       when: {
# #         sql: ${TABLE}.borninus = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.borninus = -8 ;;
# #         label: "I don't know"
# #       }
# #       when: {
# #         sql: ${TABLE}.borninus = -7 ;;
# #         label: "I prefer not to answer"
# #       }
#       when: {
#         sql: ${TABLE}.borninus = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.borninus = 2 ;;
#         label: "No"
#       }
#       else: "null"
#
#   }
# }

  dimension: carrode {
    label: "People in Vehicle to Work"
    description: "Count of People in Vehicle to Work"
    sql: CASE
          WHEN ${TABLE}.carrode >= 0 THEN CAST(${TABLE}.carrode AS STRING)
        ELSE null END ;;
  }

  dimension: carshare {
    label: "Car Share Program Usage"
    description: "Count of Car Share Program Usage"
    sql: CASE
    WHEN ${TABLE}.carrode >= 0 THEN CAST(${TABLE}.carrode AS STRING)
    ELSE null END ;;
  }

#   dimension: cdivmsar {
#     description: "Grouping of household by combination of census division, MSA status, and presence of a subway system when population greater than 1 million "
#     type: number
#     sql: ${TABLE}.CDIVMSAR ;;
#   }
#
#   dimension: census_d {
#     label: "Census Division"
#     description: "2010 Census division classification for the respondent's home address"
#     type: number
#     sql: ${TABLE}.CENSUS_D ;;
#   }
#
#   dimension: census_r {
#     label: "Census Region"
#     description: "Census region classification for home address"
#     type: number
#     sql: ${TABLE}.CENSUS_R ;;
#   }

  dimension: cnttdtr {
    label: "Number of Trips"
    description: "Count of person trips on travel day"
    type: number
    sql: ${TABLE}.CNTTDTR ;;
  }

#   dimension: condnigh {
#     label: "Condition: Limited Driving to Daytime"
#     description: "Medical Condition Results in Limiting Driving to Daytime"
#     case: {
# #       when: {
# #         sql: ${TABLE}.condnigh = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.condnigh = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.condnigh = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.condnigh = 2 ;;
#         label: "No"
#       }
#       else: "null"
#
#     }
#   }
#
#   dimension: condpub {
#     label: "Condition: Limited Use of Bus/Subway"
#     description: "Medical Condition Results in Using Bus or Subway Less Frequently"
#     case: {
# #       when: {
# #         sql: ${TABLE}.condpub = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.condpub = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.condpub = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.condpub = 2 ;;
#         label: "No"
#       }
#       else: "null"
#
#     }
#   }
#
#   dimension: condride {
#     label: "Condition: Asking Others for Rides"
#     description: "Medical Condition Results in Asking Others for Rides"
#     case: {
# #       when: {
# #         sql: ${TABLE}.condride = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.condride = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.condride = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.condride = 2 ;;
#         label: "No"
#       }
#       else: "null"
#
#     }
#   }
#
#   dimension: condrive {
#     label: "Condition: Giving Up Driving"
#     description: "Medical Condition Results in Giving up Driving"
#     case: {
# #       when: {
# #         sql: ${TABLE}.condrive = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.condrive = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.condrive = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.condrive = 2 ;;
#         label: "No"
#       }
#       else: "null"
#
#     }
#   }
#
#   dimension: condspec {
#     label: "Condition: Special Transportation Services"
#     description: "Medical Condition Results in Using Special Transportation Services"
#     case: {
# #       when: {
# #         sql: ${TABLE}.condspec = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.condspec = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.condspec = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.condspec = 2 ;;
#         label: "No"
#       }
#       else: "null"
#
#     }
#   }
#
#   dimension: condtax {
#     label: "Condition: Using Reduced Fare Taxi"
#     description: "Medical Condition Results in Using a Reduced Fare Taxi"
#     case: {
# #       when: {
# #         sql: ${TABLE}.condtax = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.condtax = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.condtax = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.condtax = 2 ;;
#         label: "No"
#       }
#       else: "null"
#
#     }
#   }
#
#   dimension: condtrav {
#     label: "Condition: Reduced Day-to-Day Travel"
#     description: "Medical Condition Results in Reduced Day-to-Day Travel"
#     case: {
# #       when: {
# #         sql: ${TABLE}.condtrav = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.condtrav = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.condtrav = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.condtrav = 2 ;;
#         label: "No"
#       }
#       else: "null"
#
#     }
#   }

#   dimension: deliver {
#     label: "Online Purchase in Last 30 Days"
#     description: "Count of Times Purchased Online for Delivery in Last 30 Days"
#     sql: CASE
#     WHEN ${TABLE}.deliver >= 0 THEN CAST(${TABLE}.deliver AS STRING)
#     ELSE null END ;;
#   }

#   dimension: diary {
#     label: "Completed Travel Diary"
#     description: "Travel Diary completion status"
#     type: number
#     sql: ${TABLE}.DIARY ;;
#   }

#   dimension: disttosc17 {
#     type: number
#     sql: ${TABLE}.DISTTOSC17 ;;
#   }
#
  dimension: disttowk17 {
    label: "Miles from home to work"
    type: number
    sql: CASE WHEN ${TABLE}.DISTTOWK17 >= 0 THEN ${TABLE}.DISTTOWK17 ELSE null END  ;;
  }

  dimension: tiered_distance_to_work {
    type: tier
    tiers: [0, 1, 2, 3, 4, 5, 10, 15, 20, 25]
    sql: ${disttowk17} ;;
  }

  dimension: driver {
    label: "Driver Status"
    description: "Driver status, derived"
    case: {
#       when: {
#         sql: ${TABLE}.driver = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.driver = 1 ;;
        label: "Yes"
      }
      when: {
        sql: ${TABLE}.driver = 2 ;;
        label: "No"
      }
      else: "null"

    }
  }

#   dimension: drvrcnt {
#     label: "Drivers in Household"
#     description: "Number of drivers in household"
#     type: number
#     sql: ${TABLE}.DRVRCNT ;;
#   }

  dimension: educ {
    label: "Education"
    description: "Educational Attainment"
    case: {
#       when: {
#         sql: ${TABLE}.educ = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.educ = -7 ;;
#         label: "I prefer not to answer"
#       }
#       when: {
#         sql: ${TABLE}.educ = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.educ = 1 ;;
        label: "Less than a high school graduate"
      }
      when: {
        sql: ${TABLE}.educ = 2 ;;
        label: "High school graduate or GED"
      }
      when: {
        sql: ${TABLE}.educ = 3 ;;
        label: "Some college or associates degree"
      }
      when: {
        sql: ${TABLE}.educ = 4 ;;
        label: "Bachelor's degree"
      }
      when: {
        sql: ${TABLE}.educ = 5 ;;
        label: "Graduate degree or professional degree"
      }
      else: "null"

    }
  }

  dimension: flextime {
    label: "Flex Time"
    case: {
#       when: {
#         sql: ${TABLE}.flextime = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.flextime = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.flextime = -7 ;;
#         label: "I prefer not to answer"
#       }
      when: {
        sql: ${TABLE}.flextime = 1 ;;
        label: "Yes"
      }
      when: {
        sql: ${TABLE}.flextime = 2 ;;
        label: "No"
      }
      else: "null"
    }
  }

#   dimension: frsthm17 {
#     label: "Travel Day began Home"
#     description: "Travel day began at home location"
#     type: number
#     sql: ${TABLE}.FRSTHM17 ;;
#   }

#   dimension: gcdwork {
#     label: "Distance between Home and Work"
#     description: "Minimum geodesic (Great Circle) distance between home and work"
#     sql:${TABLE}.gcdwork  ;;
#     }

#   dimension: gt1_jblwk {
#     label: "More Than One Job"
#     case: {
# #       when: {
# #         sql: ${TABLE}.gt1_jblwk = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.gt1_jblwk = -8 ;;
# #         label: "I don't know"
# #       }
# #       when: {
# #         sql: ${TABLE}.gt1_jblwk = -7 ;;
# #         label: "I prefer not to answer"
# #       }
#       when: {
#         sql: ${TABLE}.gt1_jblwk = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.gt1_jblwk = 2 ;;
#         label: "No"
#       }
#       else: "null"
#     }
#   }

#   dimension: hbhtnrnt {
#     description: "Category of the percent of renter-occupied housing in the census block group of the household's home location"
#     type: number
#     sql: ${TABLE}.HBHTNRNT ;;
#   }
#
#   dimension: hbhur {
#     label: "Urban / Rural indicator - Block Group"
#     type: string
#     sql: ${TABLE}.HBHUR ;;
#   }
#
#   dimension: hbppopdn {
#     label: "Population Density (Block)"
#     description: "Category of population density (persons per square mile) in the census block group of the household's home location"
#     type: number
#     sql: ${TABLE}.HBPPOPDN ;;
#   }
#
#   dimension: hbresdn {
#     label: "Housing Units Per Square Mile (Block)"
#     description: "Category of housing units per square mile in the census block group of the household's home location"
#     type: number
#     sql: ${TABLE}.HBRESDN ;;
#   }

  dimension: health {
    label: "Opinion of Health"
    case: {
#       when: {
#         sql: ${TABLE}.health = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.health = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.health = -7 ;;
#         label: "I prefer not to answer"
#       }
#       when: {
#         sql: ${TABLE}.health = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.health = 1 ;;
        label: "Excellent"
      }
      when: {
        sql: ${TABLE}.health = 2 ;;
        label: "Very good"
      }
      when: {
        sql: ${TABLE}.health = 3 ;;
        label: "Good"
      }
      when: {
        sql: ${TABLE}.health = 4 ;;
        label: "Fair"
      }
      when: {
        sql: ${TABLE}.health = 5 ;;
        label: "Poor"
      }
      else: "null"
    }
  }

#   dimension: hh_cbsa {
#     label: "CBSA FIPS Code"
#     description: "Core Based Statistical Area (CBSA) FIPS code for the respondent's home address"
#     type: string
#     sql: ${TABLE}.HH_CBSA ;;
#   }

#   dimension: hh_hisp {
#     label: "Hispanic Status"
#     description: "Hispanic status of household respondent"
#     type: number
#     sql: ${TABLE}.HH_HISP ;;
#   }

#   dimension: hh_race {
#     label: "Racial Identity"
#     description: "Race of household respondent"
#     type: number
#     sql: ${TABLE}.HH_RACE ;;
#   }

#   dimension: hhfaminc {
#     label: "Household Income"
#     type: number
#     sql: ${TABLE}.HHFAMINC ;;
#   }


  dimension: hhresp {
    hidden: yes
    type: number
    sql: ${TABLE}.HHRESP ;;
  }

#   dimension: hhsize {
#     type: number
#     sql: ${TABLE}.HHSIZE ;;
#   }
#
#   dimension: hhstate {
#     type: string
#     sql: ${TABLE}.HHSTATE ;;
#   }
#
#   dimension: hhstfips {
#     type: number
#     sql: ${TABLE}.HHSTFIPS ;;
#   }
#
#   dimension: hhvehcnt {
#     type: number
#     sql: ${TABLE}.HHVEHCNT ;;
#   }
#
#   dimension: homeown {
#     type: number
#     sql: ${TABLE}.HOMEOWN ;;
#   }

  dimension: houseid {
    label: "House ID"
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.HOUSEID;;
  }

#   dimension: hteempdn {
#     type: number
#     sql: ${TABLE}.HTEEMPDN ;;
#   }
#
#   dimension: hthtnrnt {
#     type: number
#     sql: ${TABLE}.HTHTNRNT ;;
#   }
#
#   dimension: htppopdn {
#     type: number
#     sql: ${TABLE}.HTPPOPDN ;;
#   }
#
#   dimension: htresdn {
#     type: number
#     sql: ${TABLE}.HTRESDN ;;
#   }
#
#   dimension: lif_cyc {
#     type: number
#     sql: ${TABLE}.LIF_CYC ;;
#   }

#   dimension: lpact {
#     label: "Count of Light/Moderate Physical Activity"
#     description: "Count of Times of Light or Moderate Physical Activity in Past Week"
#     sql: CASE
#     WHEN ${TABLE}.lpact >= 0 THEN CAST(${TABLE}.lpact AS STRING)
#     ELSE null END ;;
#   }

#   dimension: lsttrday17 {
#     label: "Last Trip Before Travel Day"
#     case: {
# #       when: {
# #         sql: ${TABLE}.lsttrday17 = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.lsttrday17 = -8 ;;
# #         label: "I don't know"
# #       }
# #       when: {
# #         sql: ${TABLE}.lsttrday17 = -7 ;;
# #         label: "I prefer not to answer"
# #       }
# #       when: {
# #         sql: ${TABLE}.lsttrday17 = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.lsttrday17 = 1 ;;
#         label: "The day before"
#       }
#       when: {
#         sql: ${TABLE}.lsttrday17 = 2 ;;
#         label: "A few days before"
#       }
#       when: {
#         sql: ${TABLE}.lsttrday17 = 3 ;;
#         label: "A week before"
#       }
#       when: {
#         sql: ${TABLE}.lsttrday17 = 4 ;;
#         label: "More than a week before but within a month"
#       }
#       when: {
#         sql: ${TABLE}.lsttrday17 = 5 ;;
#         label: "More than a month before"
#       }
#       else: "null"
#     }
#   }

  dimension: mcused {
    label: "Motorcycle or Moped Trips"
    description: "Count of Motorcycle or Moped Trips"
    sql: CASE
    WHEN ${TABLE}.mcused >= 0 THEN CAST(${TABLE}.mcused AS STRING)
    ELSE null END ;;
  }

  dimension: medcond {
    label: "Medical Condition"
    case: {
#       when: {
#         sql: ${TABLE}.medcond = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.medcond = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.medcond = -7 ;;
#         label: "I prefer not to answer"
#       }
      when: {
        sql: ${TABLE}.medcond = 1 ;;
        label: "Yes"
      }
      when: {
        sql: ${TABLE}.medcond = 2 ;;
        label: "No"
      }
      else: "null"
    }
  }

#   dimension: medcond6 {
#     label: "Medical Condition Duration"
#     case: {
# #       when: {
# #         sql: ${TABLE}.medcond6 = -8 ;;
# #         label: "I don't know"
# #       }
# #       when: {
# #         sql: ${TABLE}.medcond6 = -7 ;;
# #         label: "I prefer not to answer"
# #       }
# #       when: {
# #         sql: ${TABLE}.medcond6 = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.medcond6 = 1 ;;
#         label: "<= 6 months"
#       }
#       when: {
#         sql: ${TABLE}.medcond6 = 2 ;;
#         label: ">= 6 months"
#       }
#       when: {
#         sql: ${TABLE}.medcond6 = 3 ;;
#         label: "Entire life"
#       }
#       else: "null"
#     }
#   }

#   dimension: msacat {
#     type: number
#     sql: ${TABLE}.MSACAT ;;
#   }
#
#   dimension: msasize {
#     type: number
#     sql: ${TABLE}.MSASIZE ;;
#   }

  dimension: nbiketrp {
    label: "Count of Bike Trips"
    sql: CASE
    WHEN ${TABLE}.nbiketrp >= 0 THEN CAST(${TABLE}.nbiketrp AS STRING)
    ELSE null END ;;
  }

  dimension: nocong {
    label: "Minutes to Work Without Traffic"
    description: "Trip Time in Minutes to Work without Traffic"
    type: number
    sql: CASE
    WHEN ${TABLE}.nocong >= 0 THEN ${TABLE}.nocong END ;;
  }

  dimension: minutes_to_work_without_traffic_tiered{
    type: tier
    tiers: [0, 5, 10, 15, 20, 25, 30, 35, 40]
    style: integer
    sql: ${nocong} ;;
  }

#   dimension: numadlt {
#     label: "Count of Adults in Household"
#     description: "Count of adult household
# members at least 18 years old"
#     type: number
#     sql: ${TABLE}.NUMADLT ;;
#   }

  dimension: nwalktrp {
    label: "Count of Walk Trips"
    sql: CASE
    WHEN ${TABLE}.nwalktrp >= 0 THEN CAST(${TABLE}.nwalktrp AS STRING)
    ELSE null END ;;
  }

  dimension: occat {
    label: "Job Category"
    case: {
#       when: {
#         sql: ${TABLE}.occat = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.occat = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.occat = -7 ;;
#         label: "I prefer not to answer"
#       }
#       when: {
#         sql: ${TABLE}.occat = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.occat = 1 ;;
        label: "Sales or service"
      }
      when: {
        sql: ${TABLE}.occat = 2 ;;
        label: "Clerical or administrative support"
      }
      when: {
        sql: ${TABLE}.occat = 3 ;;
        label: "Manufacturing, construction, maintenance, or farming"
      }
      when: {
        sql: ${TABLE}.occat = 4 ;;
        label: "Professional, managerial, or technical"
      }
      when: {
        sql: ${TABLE}.occat = 97 ;;
        label: "Something else"
      }
      else: "null"
    }
  }

#   dimension: outcntry {
#     label: "Out of Country"
#     description: "Respondent was out of the country on Travel Day"
#     type: number
#     sql: ${TABLE}.OUTCNTRY ;;
#   }

#   dimension: outoftwn {
#     description: "Away from home for entire
# travel day"
#     type: number
#     sql: ${TABLE}.OUTOFTWN ;;
#   }

  dimension: payprof {
    label: "Work for Pay"
    description: "Work for Pay in Previous
Week"
    case: {
#       when: {
#         sql: ${TABLE}.payprof = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.payprof = -7 ;;
#         label: "I prefer not to answer"
#       }
#       when: {
#         sql: ${TABLE}.payprof = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.payprof = 1 ;;
        label: "Yes"
      }
      when: {
        sql: ${TABLE}.payprof = 2 ;;
        label: "No"
      }
      else: "null"
    }
  }

  dimension: personid {
    hidden: yes
    label: "Person ID"
    type: number
    sql: ${TABLE}.PERSONID ;;
  }
#
#   dimension: phyact {
#     label: "Level of Physical Activity"
#     case: {
# #       when: {
# #         sql: ${TABLE}.phyact = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.phyact = -8 ;;
# #         label: "I don't know"
# #       }
# #       when: {
# #         sql: ${TABLE}.phyact = -7 ;;
# #         label: "I prefer not to answer"
# #       }
#       when: {
#         sql: ${TABLE}.phyact = 1 ;;
#         label: "Rarely or never does physical activity"
#       }
#       when: {
#         sql: ${TABLE}.phyact = 2 ;;
#         label: "Some light or moderate physical activity"
#       }
#       when: {
#         sql: ${TABLE}.phyact = 3 ;;
#         label: "Some vigorous physical activity"
#       }
#       else: "null"
#     }
#   }

  dimension: prmact {
    label: "Primary Activity in last week"
    description: "Primary Activity in Previous
Week"
    case: {
#       when: {
#         sql: ${TABLE}.prmact = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.prmact = -7 ;;
#         label: "I prefer not to answer"
#       }
#       when: {
#         sql: ${TABLE}.prmact = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.prmact = 1 ;;
        label: "Working"
      }
      when: {
        sql: ${TABLE}.prmact = 2 ;;
        label: "Temporarily absent from a job or business"
      }
      when: {
        sql: ${TABLE}.prmact = 3 ;;
        label: "Looking for work / unemployed"
      }
      when: {
        sql: ${TABLE}.prmact = 4 ;;
        label: "A homemaker"
      }
      when: {
        sql: ${TABLE}.prmact = 5 ;;
        label: "Going to school"
      }
      when: {
        sql: ${TABLE}.prmact = 6 ;;
        label: "Retired"
      }
      when: {
        sql: ${TABLE}.prmact = 7 ;;
        label: "Something else"
      }
      else: "null"
    }
  }

#   dimension: proxy {
#     description: "Trip info from respondent or
# proxy"
#     type: number
#     sql: ${TABLE}.PROXY ;;
#   }

  dimension: ptused {
    label: "Count of public transit usage"
    sql: CASE
    WHEN ${TABLE}.ptused >= 0 THEN ${TABLE}.ptused
    ELSE null END ;;
  }

#   measure: total_public_transit {
#     label: "Total public transit usage"
#     type: sum
#     sql: ${ptused} ;;
#     drill_fields: [person_of_household, r_sex_imp, r_age_imp, households.hhfaminc]
#   }

  dimension: pubtime {
    label: "Minutes Transfer to Work"
    description: "Minutes Spent Transferring to
Work"
    sql: CASE
    WHEN ${TABLE}.pubtime >= 0 THEN CAST(${TABLE}.pubtime AS STRING)
    ELSE null END ;;
  }

#   dimension: r_age {
#     label: "Age"
#     type: number
#     sql: ${TABLE}.R_AGE ;;
#   }

  dimension: r_age_imp {
    label: "Age"
    type: number
    sql: ${TABLE}.R_AGE_IMP ;;
  }

  dimension: age_tier {
    type: tier
    tiers: [0,10,20,30,40,50,60,70,80]
    style: integer
    sql: ${r_age_imp} ;;
  }

  dimension: r_hisp {
    label: "Hispanic or Latino Origin"
    case: {
#       when: {
#         sql: ${TABLE}.r_hisp = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.r_hisp = -7 ;;
#         label: "I prefer not to answer"
#       }
      when: {
        sql: ${TABLE}.r_hisp = 1 ;;
        label: "Yes, Hispanic or Latino"
      }
      when: {
        sql: ${TABLE}.r_hisp = 2 ;;
        label: "Yes, Hispanic or Latino"
      }
      else: "null"
    }
  }

  dimension: r_race {
    label: "Race"
    case: {
#       when: {
#         sql: ${TABLE}.r_race = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.r_race = -7 ;;
#         label: "I prefer not to answer"
#       }
      when: {
        sql: ${TABLE}.r_race = 97 ;;
        label: "Some other race"
      }
      when: {
        sql: ${TABLE}.r_race = 1 ;;
        label: "White"
      }
      when: {
        sql: ${TABLE}.r_race = 2 ;;
        label: "Black or African American"
      }
      when: {
        sql: ${TABLE}.r_race = 3 ;;
        label: "Asian"
      }
      when: {
        sql: ${TABLE}.r_race = 4 ;;
        label: "American Indian or Alaska Native"
      }
      when: {
        sql: ${TABLE}.r_race = 5 ;;
        label: "Native Hawaiian or other Pacific Islander"
      }
      when: {
        sql: ${TABLE}.r_race = 6 ;;
        label: "Multiple responses selected"
      }
      else: "null"
    }
  }

#   dimension: r_relat {
#     label: "Relationship"
#     type: number
#     sql: ${TABLE}.R_RELAT ;;
#   }

#   dimension: r_sex {
#     label: "Gender"
#     type: number
#     sql: ${TABLE}.R_SEX ;;
#   }

  dimension: r_sex_imp {
    label: "Gender"
    case: {
      when: {
        sql: ${TABLE}.r_sex_imp = 1 ;;
        label: "Male"
      }
      when: {
        sql: ${TABLE}.r_sex_imp = 2 ;;
        label: "Female"
      }
    }
  }

#   dimension: rail {
#     type: number
#     sql: ${TABLE}.RAIL ;;
#   }

  dimension: rideshare {
    label: "Count of Rideshare App Usage"
    sql: CASE
    WHEN ${TABLE}.rideshare >= 0 THEN CAST(${TABLE}.rideshare AS STRING)
    ELSE null END ;;
  }

#   dimension: sameplc {
#     label: "Reason for No Trips"
#     type: number
#     sql: ${TABLE}.SAMEPLC ;;
#   }

  dimension: schtrn1 {
    hidden: yes
    label: "Mode to School"
    case: {
#       when: {
#         sql: ${TABLE}.schtrn1 = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.schtrn1 = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.schtrn1 = -7 ;;
#         label: "I prefer not to answer"
#       }
#       when: {
#         sql: ${TABLE}.schtrn1 = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.schtrn1 = 1 ;;
        label: "Walk"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 2 ;;
        label: "Bicycle"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 3 ;;
        label: "Car"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 4 ;;
        label: "SUV"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 5 ;;
        label: "Van"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 6 ;;
        label: "Pickup truck"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 7 ;;
        label: "Golf car/ Segway"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 8 ;;
        label: "Motorcycle / Moped"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 9 ;;
        label: "RV (motor home, ATV, snowmobile)"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 10 ;;
        label: "Schoolbus"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 11 ;;
        label: "Public or Commuter bus"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 12 ;;
        label: "Paratransit / Dial-a-ride"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 13 ;;
        label: "Private / Charter / Tour / Shuttle bus"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 14 ;;
        label: "City-to-city bus (Greyhound, Megabus)"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 15 ;;
        label: "Amtrak / Commuter rail"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 16 ;;
        label: "Subway / Elevated / Light rail / Street car"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 17 ;;
        label: "Taxi / Limo (including Uber / Lyft)"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 18 ;;
        label: "Rental car (Including Zipcar / Car2Go)"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 19 ;;
        label: "Airplane"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 20 ;;
        label: "Boat / Ferry / Water taxi"
      }
      when: {
        sql: ${TABLE}.schtrn1 = 97 ;;
        label: "Something else"
      }
      else: "null"
    }
  }

  dimension: schtrn2 {
    hidden: yes
    label: "Mode from School"
    case: {
#       when: {
#         sql: ${TABLE}.schtrn2 = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.schtrn2 = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.schtrn2 = -7 ;;
#         label: "I prefer not to answer"
#       }
#       when: {
#         sql: ${TABLE}.schtrn2 = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.schtrn2 = 1 ;;
        label: "Walk"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 2 ;;
        label: "Bicycle"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 3 ;;
        label: "Car"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 4 ;;
        label: "SUV"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 5 ;;
        label: "Van"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 6 ;;
        label: "Pickup truck"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 7 ;;
        label: "Golf car/ Segway"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 8 ;;
        label: "Motorcycle / Moped"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 9 ;;
        label: "RV (motor home, ATV, snowmobile)"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 10 ;;
        label: "Schoolbus"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 11 ;;
        label: "Public or Commuter bus"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 12 ;;
        label: "Paratransit / Dial-a-ride"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 13 ;;
        label: "Private / Charter / Tour / Shuttle bus"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 14 ;;
        label: "City-to-city bus (Greyhound, Megabus)"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 15 ;;
        label: "Amtrak / Commuter rail"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 16 ;;
        label: "Subway / Elevated / Light rail / Street car"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 17 ;;
        label: "Taxi / Limo (including Uber / Lyft)"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 18 ;;
        label: "Rental car (Including Zipcar / Car2Go)"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 19 ;;
        label: "Airplane"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 20 ;;
        label: "Boat / Ferry / Water taxi"
      }
      when: {
        sql: ${TABLE}.schtrn2 = 97 ;;
        label: "Something else"
      }
      else: "null"
    }
  }

  dimension: schtyp {
    label: "Student Status"
    case: {
#       when: {
#         sql: ${TABLE}.schtyp = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.schtyp = -7 ;;
#         label: "I prefer not to answer"
#       }
#       when: {
#         sql: ${TABLE}.schtyp = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.schtyp = 1 ;;
        label: "Public or private school"
      }
      when: {
        sql: ${TABLE}.schtyp = 2 ;;
        label: "Homeschooled"
      }
      when: {
        sql: ${TABLE}.schtyp = 3 ;;
        label: "Not in school"
      }
      else: "null"
    }
  }

#   dimension: smplsrce {
#     label: "Sample where the case
# originated"
#     type: number
#     sql: ${TABLE}.SMPLSRCE ;;
#   }

  dimension: tdaydate {
    label: "Travel Date (YYYY-MM)"
    type: number
    sql: ${TABLE}.TDAYDATE;;
  }

  dimension: timetowk {
    label: "Trip Time to Work"
    description: "Trip Time to Work in Minutes"
    sql: CASE
    WHEN ${TABLE}.timetowk >= 0 THEN CAST(${TABLE}.timetowk AS STRING)
    ELSE null END ;;
  }
#   dimension: travday {
#     label: "Weekday"
#     type: number
#     sql: ${TABLE}.TRAVDAY ;;
#   }

#   dimension: urban {
#     type: number
#     sql: ${TABLE}.URBAN ;;
#   }
#
#   dimension: urbansize {
#     type: number
#     sql: ${TABLE}.URBANSIZE ;;
#   }
#
#   dimension: urbrur {
#     type: number
#     sql: ${TABLE}.URBRUR ;;
#   }

  dimension: usepubtr {
    label: "Public Transit Usage"
    description: "Public Transit Usage on Travel
Date, derived"
    case: {
      when: {
        sql: ${TABLE}.usepubtr = 1 ;;
        label: "Yes"
      }
      when: {
        sql: ${TABLE}.usepubtr = 2 ;;
        label: "No"
      }
    }
  }

#   dimension: vpact {
#     label: "Vigorous Physical Activity in Past Week"
#     description: "Count of Times of Vigorous
# Physical Activity in Past Week"
#     sql: CASE
#     WHEN ${TABLE}.vpact >= 0 THEN CAST(${TABLE}.vpact AS STRING)
#     ELSE null END ;;
#   }

#
#   dimension: w_cane {
#     label: "Cane Usage"
#     description: "Medical Device Used: Cane"
#     case: {
# #       when: {
# #         sql: ${TABLE}.w_cane = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.w_cane = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.w_cane = 1 ;;
#         label: "Cane"
#       }
#       else: "null"
#
#     }
#   }
#
#   dimension: w_chair {
#     label: "Wheelchair Usage"
#     description: "Medical Device Used:
# Wheelchair"
#     case: {
# #       when: {
# #         sql: ${TABLE}.w_chair = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.w_chair = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.w_chair = 7 ;;
#         label: "Manual Wheelchair"
#       }
#       else: "null"
#
#     }
#   }
#
#   dimension: w_crutch {
#     label: "Crutches Usage"
#     description: "Medical Device Used:
# Crutches"
#     case: {
# #       when: {
# #         sql: ${TABLE}.w_crutch = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.w_crutch = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.w_crutch = 5 ;;
#         label: "Crutches"
#       }
#     else: "null"
#
#     }
#   }
#
#   dimension: w_dog {
#     label: "Dog Assistance Usage"
#     description: "Medical Device Used: Dog
# Assistance"
#     case: {
# #       when: {
# #         sql: ${TABLE}.w_dog = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.w_dog = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.w_dog = 4 ;;
#         label: "Seeing-eye dog or other K-9 assistance"
#       }
#       else: "null"
#
#     }
#   }
#
#   dimension: w_mtrchr {
#     label: "Motorized Wheelchair Usage"
#     description: "Medical Device Used:
# Motorized Wheelchair"
#     case: {
# #       when: {
# #         sql: ${TABLE}.w_mtrchr = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.w_mtrchr = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.w_mtrchr = 8 ;;
#         label: "Motorized wheelchair"
#       }
#       else: "null"
#
#     }
#   }
#
#   dimension: w_none {
#     label: "No Medical Device Used"
#     case: {
# #       when: {
# #         sql: ${TABLE}.w_none = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.w_none = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.w_none = 0 ;;
#         label: "No medical device used"
#       }
#       else: "null"
#
#     }
#   }
#
#   dimension: w_scootr {
#     label: "Motorized Scooter Usage"
#     description: "Medical Device Used:
# Motorized Scooter"
#     case: {
# #       when: {
# #         sql: ${TABLE}.w_scootr = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.w_scootr = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.w_scootr = 6 ;;
#         label: "Motorized Scooter"
#       }
#       else: "null"
#     }
#   }
#
#   dimension: w_whcane {
#     label: "White Cane Usage"
#     description: "Medical Device Used: White Cane"
#     case: {
# #       when: {
# #         sql: ${TABLE}.w_whcane = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.w_whcane = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.w_whcane = 3 ;;
#         label: "White cane"
#       }
#       else: "null"
#
#     }
#   }
#
#   dimension: w_wlkr {
#     label: "Walker Usage"
#     description: "Medical Device Used: Walker"
#     case: {
# #       when: {
# #         sql: ${TABLE}.w_wlkr = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.w_wlkr = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.w_wlkr = 2;;
#         label: "Walker"
#       }
#       else: "null"
#
#     }
#   }

  dimension: walk4_ex {
    label: "Walk Trips For Exercise"
    description: "Count of Walk Trips for
Exercise"
    type: number
    sql: CASE
    WHEN ${TABLE}.walk4_ex >= 0 THEN CAST(${TABLE}.walk4_ex AS STRING)
    ELSE null END ;;
  }

  dimension: walk_def {
    label: "Not Walking More: Infrastructure"
    description: "Reason for Not Walking More:
Infrastructure"
    case: {
#       when: {
#         sql: ${TABLE}.walk_def = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.walk_def = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.walk_def = 1 ;;
        label: "No nearby paths or trails"
      }
      when: {
        sql: ${TABLE}.walk_def = 2 ;;
        label: "No sidewalks or sidewalks are in poor condition"
      }
      when: {
        sql: ${TABLE}.walk_def = 3 ;;
        label: "No nearby parks"
      }
      when: {
        sql: ${TABLE}.walk_def = 4 ;;
        label: "No nearby paths/trails and poor sidewalks"
      }
      when: {
        sql: ${TABLE}.walk_def = 5 ;;
        label: "No nearby paths/trails and no nearby parks"
      }
      when: {
        sql: ${TABLE}.walk_def = 6 ;;
        label: "Poor sidewalks and no nearby parks"
      }
      when: {
        sql: ${TABLE}.walk_def = 7 ;;
        label: "No nearby paths or parks, and poor sidewalks"
      }
      else: "null"

    }
  }

  dimension: walk_gkq {
    label: "Not Walking More: Safety"
    description: "Reason for Not Walking More:
Safety"
    case: {
#       when: {
#         sql: ${TABLE}.walk_gkq = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.walk_gkq = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.walk_gkq = 1 ;;
        label: "Street crossings are unsafe"
      }
      when: {
        sql: ${TABLE}.walk_gkq = 2 ;;
        label: "Heavy traffic with too many cars"
      }
      when: {
        sql: ${TABLE}.walk_gkq = 3 ;;
        label: "Not enough lighting at night"
      }
      when: {
        sql: ${TABLE}.walk_gkq = 4 ;;
        label: "Street crossings are unsafe and heavy traffic"
      }
      when: {
        sql: ${TABLE}.walk_gkq = 5 ;;
        label: "Street crossings are unsafe and not enough lighting"
      }
      when: {
        sql: ${TABLE}.walk_gkq = 6 ;;
        label: "Heavy traffic and not enough lighting"
      }
      when: {
        sql: ${TABLE}.walk_gkq = 7 ;;
        label: "Street crossings are unsafe, heavy traffic, and not enough lighting"
      }
      else: "null"

    }
  }

#   dimension: whoproxy {
#     description: "Household Person Identifier
# Responsible for Trip Reporting"
#     type: number
#     sql: ${TABLE}.WHOPROXY ;;
#   }

  dimension: wkfmhmxx {
    label: "WFH days in Last Month"
    description: "Count of Days Worked From
Home in Last Month"
    sql: CASE
    WHEN ${TABLE}.wkfmhmxx >= 0 THEN CAST(${TABLE}.wkfmhmxx AS STRING)
    ELSE null END ;;
  }

  dimension: wkftpt {
    label: "Full-Time/Part-Time"
    description: "Full-Time or Part-Time Worker"
    case: {
#       when: {
#         sql: ${TABLE}.wkftpt = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.wkftpt = -7 ;;
#         label: "I prefer not to answer"
#       }
#       when: {
#         sql: ${TABLE}.wkftpt = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.wkftpt = 1 ;;
        label: "Full-time"
      }
      when: {
        sql: ${TABLE}.wkftpt = 2 ;;
        label: "Part-time"
      }
      else: "null"

    }
  }

  dimension: wkrmhm {
    label: "Option of WFH"
    description: "Option of Working from Home"
    case: {
#       when: {
#         sql: ${TABLE}.wkrmhm = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.wkrmhm = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.wkrmhm = -7 ;;
#         label: "I prefer not to answer"
#       }
      when: {
        sql: ${TABLE}.wkrmhm = -1 ;;
        label: "Appropriate skip"
      }
      when: {
        sql: ${TABLE}.wkrmhm = 1 ;;
        label: "Yes"
      }
      when: {
        sql: ${TABLE}.wkrmhm = 2 ;;
        label: "No"
      }
      else: "null"
    }
  }

#   dimension: wkstfips {
#     label: "State FIPS code of Work Address"
#     description: "The state FIPS code for the
# respondent's geocoded work
# address. The state FIPS codes
# were identified using United
# States Census Bureau 2016"
#     type: number
#     sql: ${TABLE}.WKSTFIPS ;;
#   }

  dimension: worker {
    label: "Worker Status"
    case: {
#       when: {
#         sql: ${TABLE}.worker = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.worker = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.worker = 1;;
        label: "Yes"
      }
      when: {
        sql: ${TABLE}.worker = 2;;
        label: "No"
      }
      else: "null"
    }
  }

  dimension: wrk_home {
    label: "Work From Home"
    case: {
#       when: {
#         sql: ${TABLE}.wrk_home = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.wrk_home = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.wrk_home = -7 ;;
#         label: "I prefer not to answer"
#       }
#       when: {
#         sql: ${TABLE}.wrk_home = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.wrk_home = 1 ;;
        label: "Yes"
      }
      when: {
        sql: ${TABLE}.wrk_home = 2 ;;
        label: "No"
      }
      else: "null"
    }
  }

#   dimension: wrkcount {
#     label: "Number of Workers"
#     description: "Number of workers in household"
#     type: number
#     sql: ${TABLE}.WRKCOUNT ;;
#   }

  dimension: wrktime {
    label: "Arrival Time at Work"
    sql: CASE WHEN ${TABLE}.wrktime != "-9" AND
                    ${TABLE}.wrktime != "-8" AND
                    ${TABLE}.wrktime != "-7" AND
                    ${TABLE}.wrktime != "-1"
               THEN ${TABLE}.wrktime ELSE "null" END  ;;
  }


  dimension: wrktrans {
    label: "Mode to Work"
    case: {
#       when: {
#         sql: ${TABLE}.wrktrans = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.wrktrans = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.wrktrans = -7 ;;
#         label: "I prefer not to answer"
#       }
#       when: {
#         sql: ${TABLE}.wrktrans = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.wrktrans = 1 ;;
        label: "Walk"
      }
      when: {
        sql: ${TABLE}.wrktrans = 2 ;;
        label: "Bicycle"
      }
      when: {
        sql: ${TABLE}.wrktrans = 3 ;;
        label: "Car"
      }
      when: {
        sql: ${TABLE}.wrktrans = 4 ;;
        label: "SUV"
      }
      when: {
        sql: ${TABLE}.wrktrans = 5 ;;
        label: "Van"
      }
      when: {
        sql: ${TABLE}.wrktrans = 6 ;;
        label: "Pickup truck"
      }
      when: {
        sql: ${TABLE}.wrktrans = 7 ;;
        label: "Golf car/ Segway"
      }
      when: {
        sql: ${TABLE}.wrktrans = 8 ;;
        label: "Motorcycle / Moped"
      }
      when: {
        sql: ${TABLE}.wrktrans = 9 ;;
        label: "RV (motor home, ATV, snowmobile)"
      }
      when: {
        sql: ${TABLE}.wrktrans = 10 ;;
        label: "Schoolbus"
      }
      when: {
        sql: ${TABLE}.wrktrans = 11 ;;
        label: "Public or Commuter bus"
      }
      when: {
        sql: ${TABLE}.wrktrans = 12 ;;
        label: "Paratransit / Dial-a-ride"
      }
      when: {
        sql: ${TABLE}.wrktrans = 13 ;;
        label: "Private / Charter / Tour / Shuttle bus"
      }
      when: {
        sql: ${TABLE}.wrktrans = 14 ;;
        label: "City-to-city bus (Greyhound, Megabus)"
      }
      when: {
        sql: ${TABLE}.wrktrans = 15 ;;
        label: "Amtrak / Commuter rail"
      }
      when: {
        sql: ${TABLE}.wrktrans = 16 ;;
        label: "Subway / Elevated / Light rail / Street car"
      }
      when: {
        sql: ${TABLE}.wrktrans = 17 ;;
        label: "Taxi / Limo (including Uber / Lyft)"
      }
      when: {
        sql: ${TABLE}.wrktrans = 18 ;;
        label: "Rental car (Including Zipcar / Car2Go)"
      }
      when: {
        sql: ${TABLE}.wrktrans = 19 ;;
        label: "Airplane"
      }
      when: {
        sql: ${TABLE}.wrktrans = 20 ;;
        label: "Boat / Ferry / Water taxi"
      }
      when: {
        sql: ${TABLE}.wrktrans = 97 ;;
        label: "Something else"
      }
      else: "n/a"
    }
  }

#   dimension: wtperfin {
#     description: "Final Person weight"
#     type: number
#     sql: ${TABLE}.WTPERFIN ;;
#   }

  dimension: yearmile {
    label: "Miles Driven"
    description: "Miles Personally Driven in all
Vehicles"
    sql: CASE
    WHEN ${TABLE}.yearmile >= 0 THEN ${TABLE}.yearmile
    ELSE null END ;;
  }

#   dimension: yrtous {
#     label: "Arrival in USA"
#     description: "Year of Arrival in United States"
#     sql: CASE
#     WHEN ${TABLE}.yrtous >= 0 THEN CAST(${TABLE}.yrtous AS STRING)
#     ELSE null END ;;
#   }

  measure: count {
    type: count
    drill_fields: [personid, vehicles.count, trips.count]
  }
}
