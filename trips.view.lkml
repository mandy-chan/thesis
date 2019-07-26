view: trips {
  sql_table_name: household_travel_data.trips ;;

#   dimension: person_of_household {
#     sql: CONCAT(CAST(${TABLE}.HOUSEID AS STRING), '-', CAST(${TABLE}.PERSONID AS STRING)) ;;
#   }
#
#   dimension: respondent_of_household {
#     sql: CONCAT(CAST(${TABLE}.HOUSEID AS STRING), '-', CAST(${TABLE}.HHRESP AS STRING)) ;;
#   }

  dimension: houseid {
    hidden: yes
    label: "House ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.HOUSEID ;;
  }

#   dimension: cdivmsar {
#     type: number
#     sql: ${TABLE}.CDIVMSAR ;;
#   }
#
#   dimension: census_d {
#     type: number
#     sql: ${TABLE}.CENSUS_D ;;
#   }
#
#   dimension: census_r {
#     type: number
#     sql: ${TABLE}.CENSUS_R ;;
#   }

#   dimension: driver {
#     label: "Driver Status"
#     type: number
#     sql: ${TABLE}.DRIVER ;;
#   }

#   dimension: drop_prk {
#     label: "Parked/Dropped Off"
#     description: "Parked or Dropped Off at
# Station"
#     case: {
# #       when: {
# #         sql: ${TABLE}.drop_prk = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.drop_prk = -8 ;;
# #         label: "I prefer not to answer"
# #       }
# #       when: {
# #         sql: ${TABLE}.drop_prk = -7 ;;
# #         label: "I prefer not to answer"
# #       }
# #       when: {
# #         sql: ${TABLE}.drop_prk = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.drop_prk = 1 ;;
#         label: "Parked"
#       }
#       when: {
#         sql: ${TABLE}.drop_prk = 2 ;;
#         label: "Dropped off"
#       }
#       when: {
#         sql: ${TABLE}.drop_prk = 3 ;;
#         label: "Walked or biked to bus/train"
#       }
#       else: "null"
#     }
#   }

  dimension: drvr_flg {
    label: "Drove on Trip"
    description: "Respondent drove on trip"
    type: number
    sql: ${TABLE}.DRVR_FLG ;;
  }

#   dimension: drvrcnt {
#     label: "Number of Drivers"
#     description: "Number of drivers in household"
#     type: number
#     sql: ${TABLE}.DRVRCNT ;;
#   }

#   dimension: dweltime {
#     label: "Time at Destination"
#     type: number
#     sql: ${TABLE}.DWELTIME ;;
#   }

#   dimension: educ {
#     type: number
#     sql: ${TABLE}.EDUC ;;
#   }

  dimension: endtime {
    label: "Trip End Time"
    case: {
    when: {
      sql: ${TABLE}.endtime BETWEEN 0 AND 59 ;;
      label: "12 AM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 100 AND 159 ;;
      label: "1 AM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 200 AND 259 ;;
      label: "2 AM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 300 AND 359 ;;
      label: "3 AM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 400 AND 459 ;;
      label: "4 AM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 500 AND 559 ;;
      label: "5 AM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 600 AND 659 ;;
      label: "6 AM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 700 AND 759 ;;
      label: "7 AM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 800 AND 859 ;;
      label: "8 AM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 900 AND 959 ;;
      label: "9 AM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 1000 AND 1059 ;;
      label: "10 AM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 1100 AND 1159 ;;
      label: "11 AM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 1200 AND 1259 ;;
      label: "12 PM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 1300 AND 1359 ;;
      label: "1 PM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 1400 AND 1459 ;;
      label: "2 PM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 1500 AND 1559 ;;
      label: "3 PM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 1600 AND 1659 ;;
      label: "4 PM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 1700 AND 1759  ;;
      label: "5 PM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 1800 AND 1859 ;;
      label: "6 PM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 1900 AND 1959 ;;
      label: "7 PM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 2000 AND 2059 ;;
      label: "8 PM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 2100 AND 2159 ;;
      label: "9 PM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 2200 AND 2259 ;;
      label: "10 PM"
    }
    when: {
      sql: ${TABLE}.endtime BETWEEN 2300 AND 2359 ;;
      label: "11 PM"
    }
    else: "null"
  }
}

  dimension: gasprice {
    label: "Gas Price"
    description: "Price of gasoline, in cents, on
respondent's travel day"
    type: number
    sql: ${TABLE}.GASPRICE ;;
  }

#   dimension: hbhtnrnt {
#     type: number
#     sql: ${TABLE}.HBHTNRNT ;;
#   }

#   dimension: hbhur {
#     type: string
#     sql: ${TABLE}.HBHUR ;;
#   }

#   dimension: hbppopdn {
#     type: number
#     sql: ${TABLE}.HBPPOPDN ;;
#   }

#   dimension: hbresdn {
#     type: number
#     sql: ${TABLE}.HBRESDN ;;
#   }

#   dimension: hh_cbsa {
#     type: string
#     sql: ${TABLE}.HH_CBSA ;;
#   }
#
#   dimension: hh_hisp {
#     type: number
#     sql: ${TABLE}.HH_HISP ;;
#   }

#   dimension: hh_ontd {
#     label: "Number of Household Members on Trip"
#     description: "Number of household
# members on trip including
# respondent"
#     sql: CASE
#     WHEN ${TABLE}.hh_ontd = -9 THEN "Not ascertained"
#     ELSE CAST(${TABLE}.hh_ontd AS STRING) END ;;
#   }

#   dimension: hh_race {
#     type: number
#     sql: ${TABLE}.HH_RACE ;;
#   }

  dimension: hhfaminc {
    hidden: yes
    type: number
    sql: ${TABLE}.HHFAMINC ;;
  }

#   dimension: hhmemdrv {
#     label: "Drove on Trip"
#     description: "Household member drove on trip"
#     type: number
#     sql: ${TABLE}.HHMEMDRV ;;
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
  dimension: hhstate {
    hidden: yes
    type: string
    sql: ${TABLE}.HHSTATE ;;
  }
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

#   dimension: homeown {
#     type: number
#     sql: ${TABLE}.HOMEOWN ;;
#   }

#
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

#   dimension: htresdn {
#     type: number
#     sql: ${TABLE}.HTRESDN ;;
#   }
#
#   dimension: lif_cyc {
#     type: number
#     sql: ${TABLE}.LIF_CYC ;;
#   }

#   dimension: loop_trip {
#     label: "Loop Trip"
#     description: "Trip origin and destination at
# identical location"
#     case: {
#       when: {
#         sql: ${TABLE}.loop_trip = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.loop_trip = 2 ;;
#         label: "No"
#       }
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

#   dimension: nonhhcnt {
#     label: "Non-household Members"
#     description: "Number of non-household
# members on trip"
#     type: number
#     sql: ${TABLE}.NONHHCNT ;;
#   }

#   dimension: numadlt {
#     type: number
#     sql: ${TABLE}.NUMADLT ;;
#   }

  dimension: numontrp {
    label: "Number of People on Trips"
    description: "Number of people on trip
including respondent"
    type:  number
    sql: CASE
    WHEN ${TABLE}.numontrp >= 0 THEN ${TABLE}.numontrp END ;;
  }

#   dimension: numtrans {
#     label: "Count of Transfers"
#     sql: CASE
#     WHEN ${TABLE}.numtrans >= 0 THEN CAST(${TABLE}.numtrans AS STRING)
#     ELSE null END ;;
#   }

#   dimension: ontd_p1 {
#     type: number
#     sql: ${TABLE}.ONTD_P1 ;;
#   }
#
#   dimension: ontd_p10 {
#     type: number
#     sql: ${TABLE}.ONTD_P10 ;;
#   }
#
#   dimension: ontd_p11 {
#     type: number
#     sql: ${TABLE}.ONTD_P11 ;;
#   }
#
#   dimension: ontd_p12 {
#     type: number
#     sql: ${TABLE}.ONTD_P12 ;;
#   }
#
#   dimension: ontd_p13 {
#     type: number
#     sql: ${TABLE}.ONTD_P13 ;;
#   }
#
#   dimension: ontd_p2 {
#     type: number
#     sql: ${TABLE}.ONTD_P2 ;;
#   }
#
#   dimension: ontd_p3 {
#     type: number
#     sql: ${TABLE}.ONTD_P3 ;;
#   }
#
#   dimension: ontd_p4 {
#     type: number
#     sql: ${TABLE}.ONTD_P4 ;;
#   }
#
#   dimension: ontd_p5 {
#     type: number
#     sql: ${TABLE}.ONTD_P5 ;;
#   }
#
#   dimension: ontd_p6 {
#     type: number
#     sql: ${TABLE}.ONTD_P6 ;;
#   }
#
#   dimension: ontd_p7 {
#     type: number
#     sql: ${TABLE}.ONTD_P7 ;;
#   }
#
#   dimension: ontd_p8 {
#     type: number
#     sql: ${TABLE}.ONTD_P8 ;;
#   }

  dimension: personid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.PERSONID ;;
  }

#   dimension: ontd_p9 {
#     type: number
#     sql: ${TABLE}.ONTD_P9 ;;
#   }

#   dimension: prmact {
#     type: number
#     sql: ${TABLE}.PRMACT ;;
#   }
#
#   dimension: proxy {
#     type: number
#     sql: ${TABLE}.PROXY ;;
#   }

#   dimension: psgr_flg {
#     label: "Passenger on Trip"
#     description: "Respondent was passenger on
# trip"
#     case: {
# #       when: {
# #         sql: ${TABLE}.psgr_flg = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.psgr_flg = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.psgr_flg = 2 ;;
#         label: "No"
#       }
#       else: "null"
#     }
#   }

  dimension: pubtrans {
    label: "Public Transportation Used"
    description: "Public transportation used on
trip"
    case: {
      when: {
        sql: ${TABLE}.pubtrans = 1 ;;
        label: "Yes"
      }
      when: {
        sql: ${TABLE}.pubtrans = 2 ;;
        label: "No"
      }
    }
  }

#   dimension: r_age {
#     type: number
#     sql: ${TABLE}.R_AGE ;;
#   }
#
#   dimension: r_age_imp {
#     type: number
#     sql: ${TABLE}.R_AGE_IMP ;;
#   }

#   dimension: r_sex {
#     type: number
#     sql: ${TABLE}.R_SEX ;;
#   }
#
#   dimension: r_sex_imp {
#     type: number
#     sql: ${TABLE}.R_SEX_IMP ;;
#   }

#   dimension: rail {
#     type: number
#     sql: ${TABLE}.RAIL ;;
#   }
#
#   dimension: smplsrce {
#     type: number
#     sql: ${TABLE}.SMPLSRCE ;;
#   }

  dimension: strttime {
    label: "Trip Start Time"
    case: {
      when: {
        sql: ${TABLE}.strttime BETWEEN 0 AND 59 ;;
        label: "0 AM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 100 AND 159 ;;
        label: "1 AM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 200 AND 259 ;;
        label: "2 AM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 300 AND 359 ;;
        label: "3 AM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 400 AND 459 ;;
        label: "4 AM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 500 AND 559 ;;
        label: "5 AM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 600 AND 659 ;;
        label: "6 AM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 700 AND 759 ;;
        label: "7 AM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 800 AND 859 ;;
        label: "8 AM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 900 AND 959 ;;
        label: "9 AM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 1000 AND 1059 ;;
        label: "10 AM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 1100 AND 1159 ;;
        label: "11 AM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 1200 AND 1259 ;;
        label: "12 PM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 1300 AND 1359 ;;
        label: "1 PM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 1400 AND 1459 ;;
        label: "2 PM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 1500 AND 1559 ;;
        label: "3 PM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 1600 AND 1659 ;;
        label: "4 PM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 1700 AND 1759  ;;
        label: "5 PM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 1800 AND 1859 ;;
        label: "6 PM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 1900 AND 1959 ;;
        label: "7 PM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 2000 AND 2059 ;;
        label: "8 PM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 2100 AND 2159 ;;
        label: "9 PM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 2200 AND 2259 ;;
        label: "10 PM"
      }
      when: {
        sql: ${TABLE}.strttime BETWEEN 2300 AND 2359 ;;
        label: "11 PM"
      }
      else: "null"
    }
  }

#   dimension: tdaydate {
#     label: "Travel Date (YYYYMM)"
#     type: number
#     sql: ${TABLE}.TDAYDATE ;;
#   }

  dimension: tdcaseid {
    primary_key: yes
    label: "Trip ID"
    description: "Unique identifier for every trip
record in the file"
    type: number
    value_format_name: id
    sql: ${TABLE}.TDCASEID ;;
  }

#   dimension: tdtrpnum {
#     description: "Incrementing travel day trip
# number, starting at 1 for each
# person in the file"
#     type: number
#     sql: ${TABLE}.TDTRPNUM ;;
#   }

  dimension: tdwknd {
    label: "Weekend Trip"
    case: {
      when: {
        sql: ${TABLE}.tdwknd = 1 ;;
        label: "Yes"
      }
      when: {
        sql: ${TABLE}.tdwknd = 2 ;;
        label: "No"
      }
    }
  }

#   dimension: tracc_bus {
#     label: "Bus to Public Transit"
#     description: "Bus as mode used to get to
# public transit?"
#     case: {
# #       when: {
# #         sql: ${TABLE}.tracc_bus = -9 ;;
# #         label: "Not ascertained"
# #         }
# #       when: {
# #         sql: ${TABLE}.tracc_bus = -1 ;;
# #         label: "Appropriate skip"
# #         }
#       when: {
#         sql: ${TABLE}.tracc_bus = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.tracc_bus = 2 ;;
#         label: "No"
#       }
#       else: "null"
#     }
#   }
#
#   dimension: tracc_crl {
#     label: "Rail to Public Transit"
#     description: "Rail as mode used to get to
# public transit?"
#     case: {
# #       when: {
# #         sql: ${TABLE}.tracc_crl = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.tracc_crl = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.tracc_crl = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.tracc_crl = 2 ;;
#         label: "No"
#       }
#       else: "null"
#     }
#   }

#   dimension: tracc_oth {
#     label: "Other Mode to Public Transit"
#     description: "Other mode used to get to
# public transit?"
#     case: {
# #       when: {
# #         sql: ${TABLE}.tracc_oth = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.tracc_oth = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.tracc_oth = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.tracc_oth = 2 ;;
#         label: "No"
#       }
#       else: "null"
#     }
#   }

#   dimension: tracc_pov {
#     label: "POV to Public Transit"
#     description: "Privately Owned Vehicle as mode used to get to
# public transit?"
#     case: {
# #       when: {
# #         sql: ${TABLE}.tracc_pov = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.tracc_pov = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.tracc_pov = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.tracc_pov = 2 ;;
#         label: "No"
#       }
#       else: "null"
#     }
#   }
#
#   dimension: tracc_sub {
#     label: "Subway to Public Transit"
#     description: "Subway as mode used to get to
# public transit?"
#     case: {
# #       when: {
# #         sql: ${TABLE}.tracc_sub = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.tracc_sub = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.tracc_sub = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.tracc_sub = 2 ;;
#         label: "No"
#       }
#       else: "null"
#     }
#   }

#   dimension: tracc_wlk {
#     label: "Walking to Public Transit"
#     description: "Walking as mode used to get to
# public transit?"
#     case: {
# #       when: {
# #         sql: ${TABLE}.tracc_walk = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.tracc_walk = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.tracc_walk = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.tracc_walk = 2 ;;
#         label: "No"
#       }
#       else: "null"
#     }
#   }

#   dimension: tracctm {
#     label: "Trip Time to Transit Station"
#     description: "Trip Time to Transit Station in Minutes"
#     sql: CASE
#     WHEN ${TABLE}.tracctm >= 0 THEN CAST(${TABLE}.tracctm AS STRING)
#     ELSE null END ;;
#     }

  dimension: travday {
    label: "Weekday"
    case: {
      when: {
        sql: ${TABLE}.travday = 1 ;;
        label: "Sunday"
      }
      when: {
        sql: ${TABLE}.travday = 2 ;;
        label: "Monday"
      }
      when: {
        sql: ${TABLE}.travday = 3 ;;
        label: "Tuesday"
      }
      when: {
        sql: ${TABLE}.travday = 4 ;;
        label: "Wednesday"
      }
      when: {
        sql: ${TABLE}.travday = 5 ;;
        label: "Thursday"
      }
      when: {
        sql: ${TABLE}.travday = 6 ;;
        label: "Friday"
      }
      when: {
        sql: ${TABLE}.travday = 7 ;;
        label: "Saturday"
      }
    }
  }

#   dimension: tregr_bus {
#     label: "Bus From Public Transit"
#     description: "Bus as mode used to get from
# public transit?"
#    case: {
# #     when: {
# #       sql: ${TABLE}.tregr_bus = -9 ;;
# #       label: "Not ascertained"
# #     }
# #     when: {
# #       sql: ${TABLE}.tregr_bus = -1 ;;
# #       label: "Appropriate skip"
# #     }
#     when: {
#       sql: ${TABLE}.tregr_bus = 1 ;;
#       label: "Yes"
#     }
#     when: {
#       sql: ${TABLE}.tregr_bus = 2 ;;
#       label: "No"
#     }
#     else: "null"
#   }
#   }
#
#   dimension: tregr_crl {
#     label: "Rail From Public Transit"
#     description: "Rail as mode used to get from
# public transit?"
#     case: {
# #       when: {
# #         sql: ${TABLE}.tregr_crl = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.tregr_crl = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.tregr_crl = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.tregr_crl = 2 ;;
#         label: "No"
#       }
#       else: "null"
#     }
#   }

#   dimension: tregr_oth {
#     label: "Other Mode From Public Transit"
#     description: "Other mode used to get from
# public transit?"
#     case: {
# #       when: {
# #         sql: ${TABLE}.tregr_oth = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.tregr_oth = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.tregr_oth = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.tregr_oth = 2 ;;
#         label: "No"
#       }
#       else: "null"
#     }
#   }
#
#   dimension: tregr_pov {
#     label: "POV From Public Transit"
#     description: "POV as mode used to get from
# public transit?"
#     case: {
# #       when: {
# #         sql: ${TABLE}.tregr_pov = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.tregr_pov = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.tregr_pov = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.tregr_pov = 2 ;;
#         label: "No"
#       }
#       else: "null"
#     }
#   }
#
#   dimension: tregr_sub {
#     label: "Subway From Public Transit"
#     description: "Subway as mode used to get from
# public transit?"
#     case: {
# #       when: {
# #         sql: ${TABLE}.tregr_sub = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.tregr_sub = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.tregr_sub = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.tregr_sub = 2 ;;
#         label: "No"
#       }
#       else: "null"
#     }
#   }
#
#   dimension: tregr_wlk {
#     label: "Walking From Public Transit"
#     description: "Walking as mode used to get from
# public transit?"
#     case: {
# #       when: {
# #         sql: ${TABLE}.tregr_wlk = -9 ;;
# #         label: "Not ascertained"
# #       }
# #       when: {
# #         sql: ${TABLE}.tregr_wlk = -1 ;;
# #         label: "Appropriate skip"
# #       }
#       when: {
#         sql: ${TABLE}.tregr_wlk = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.tregr_wlk = 2 ;;
#         label: "No"
#       }
#       else: "null"
#     }
#   }

  dimension: POV_used {
    label: "POV used"
    description: "Privately Owned Vehicle Used on Trip"
    type: yesno
    sql:  ${TABLE}.trptrans IN (3,4,5,6,8,9);;
  }

#   dimension: tregrtm {
#     label: "Time to Destination From Transit"
#     description: "Time to Destination from
# Transit in Minutes"
#     sql: CASE
#     WHEN ${TABLE}.tregrtm >= 0 THEN CAST(${TABLE}.tregrtm AS STRING)
#     ELSE null END ;;
#   }

#   dimension: trippurp {
#     label: "Purpose of Trip"
#     description: "Generalized purpose of trip,
# home-based and non-home
# based"
#     type: string
#     sql: ${TABLE}.TRIPPURP ;;
#   }

#   dimension: trpaccmp {
#     label: "Count of People on Trip"
#     type: number
#     sql: ${TABLE}.TRPACCMP ;;
#   }

#   dimension: trphhacc {
#     label: "Household Members on Trip"
#     description: "Count of Household Members
# on Trip"
#     type: number
#     sql: ${TABLE}.TRPHHACC ;;
#   }

#   dimension: trphhveh {
#     label: "Household Vehicle Used"
#     description: "Household Vehicle Used on
# Trip"
#     case: {
#       when: {
#         sql: ${TABLE}.trphhveh = 1 ;;
#         label: "Yes"
#       }
#       when: {
#         sql: ${TABLE}.trphhveh = 2 ;;
#         label: "No"
#       }
#     }
#   }

  dimension: trpmiles {
    label: "Trip Miles"
    description: "Trip distance in miles, derived
from route geometry returned"
    type:  number
    sql:  CASE WHEN ${TABLE}.trpmiles >= 0 THEN ${TABLE}.trpmiles END;;
  }

#   measure: sum_trpmiles {
#     type: sum
#     sql: ${trpmiles}*${weighted} ;;
#   }
#
#   measure: avg_trpmiles {
#     label: "Average Trip Miles"
#     type: number
#     sql: ${sum_trpmiles}/${count_trips} ;;
#     value_format: "0.00"
#   }

  dimension: trpmiles_tiered {
    label: "Trip Miles, Tiered"
    type: tier
    tiers: [0, 0.5, 1, 2, 3, 4, 5, 6]
    style: interval
    sql: CASE
    WHEN ${TABLE}.trpmiles >= 0 THEN ${TABLE}.trpmiles END ;;
  }

#    dimension: mph {
#     label: "Speed (miles per min)"
#     type: number
#     sql: CAST((${trpmiles}*${TABLE}.WTTRDFIN)/((${trvlcmin}/60)*${TABLE}.WTTRDFIN) AS INT64);;
#     value_format: "0"
#   }
#
#   dimension: tiered_mph {
#     type: tier
#     tiers: [0, 10, 20, 30, 40, 50]
#     style: integer
#     sql: (${trpmiles}*${TABLE}.WTTRDFIN)/((${trvlcmin}/60)*${TABLE}.WTTRDFIN) ;;
#   }

  dimension: trptrans {
    label: "Trip Mode"
    description: "Trip Mode, derived"
    case: {
#       when: {
#         sql: ${TABLE}.trptrans = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.trptrans = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.trptrans = -7 ;;
#         label: "I prefer not to answer"
#       }
      when: {
        sql: ${TABLE}.trptrans = 1 ;;
        label: "Walk"
      }
      when: {
        sql: ${TABLE}.trptrans = 2 ;;
        label: "Bicycle"
      }
      when: {
        sql: ${TABLE}.trptrans = 3 ;;
        label: "Car"
      }
      when: {
        sql: ${TABLE}.trptrans = 4 ;;
        label: "SUV"
      }
      when: {
        sql: ${TABLE}.trptrans = 5 ;;
        label: "Van"
      }
      when: {
        sql: ${TABLE}.trptrans = 6 ;;
        label: "Pickup truck"
      }
      when: {
        sql: ${TABLE}.trptrans = 7 ;;
        label: "Golf car/ Segway"
      }
      when: {
        sql: ${TABLE}.trptrans = 8 ;;
        label: "Motorcycle / Moped"
      }
      when: {
        sql: ${TABLE}.trptrans = 9 ;;
        label: "RV (motor home, ATV, snowmobile)"
      }
      when: {
        sql: ${TABLE}.trptrans = 10 ;;
        label: "Schoolbus"
      }
      when: {
        sql: ${TABLE}.trptrans = 11 ;;
        label: "Public or Commuter bus"
      }
      when: {
        sql: ${TABLE}.trptrans = 12 ;;
        label: "Paratransit / Dial-a-ride"
      }
      when: {
        sql: ${TABLE}.trptrans = 13 ;;
        label: "Private / Charter / Tour / Shuttle bus"
      }
      when: {
        sql: ${TABLE}.trptrans = 14 ;;
        label: "City-to-city bus (Greyhound, Megabus)"
      }
      when: {
        sql: ${TABLE}.trptrans = 15 ;;
        label: "Amtrak / Commuter rail"
      }
      when: {
        sql: ${TABLE}.trptrans = 16 ;;
        label: "Subway / Elevated / Light rail / Street car"
      }
      when: {
        sql: ${TABLE}.trptrans = 17 ;;
        label: "Taxi / Limo (including Uber / Lyft)"
      }
      when: {
        sql: ${TABLE}.trptrans = 18 ;;
        label: "Rental car (Including Zipcar / Car2Go)"
      }
      when: {
        sql: ${TABLE}.trptrans = 19 ;;
        label: "Airplane"
      }
      when: {
        sql: ${TABLE}.trptrans = 20 ;;
        label: "Boat / Ferry / Water taxi"
      }
      when: {
        sql: ${TABLE}.trptrans = 97 ;;
        label: "Something else"
      }
      else: "n/a"
    }
  }

  dimension: trvlcmin {
    label: "Trip Duration (minutes)"
    type: number
    sql: CASE
    WHEN ${TABLE}.trvlcmin > 0 THEN ${TABLE}.trvlcmin
    ELSE null END ;;
  }

  dimension: tiered_duration {
    type: tier
    tiers: [0,5,10,20,30,40,50,60]
    style: integer
    sql: ${trvlcmin} ;;
  }

#   measure: average_trip_duration {
#     type: average
#     sql: ${trvlcmin};;
#     value_format: "0"
#   }

  dimension: weighted {
    hidden: yes
    type: number
    sql: ${TABLE}.WTTRDFIN ;;
  }

#   dimension: trwaittm {
#     label: "Transit Wait Time"
#     description: "Transit wait time in minutes"
#     sql: CASE
#     WHEN ${TABLE}.trwaittm >= 0 THEN CAST(${TABLE}.trwaittm AS STRING)
#     ELSE null END ;;
#   }

#   dimension: urban {
#     label:  "Urban Area Classification"
#     description: "Household's urban area
# classification, based on home
# address and 2014 TIGER/Line
# Shapefile"
#     type: number
#     sql: ${TABLE}.URBAN ;;
#   }
#
#   dimension: urbansize {
#     label: "Urban Area Size"
#     description: "Urban area size where home
# address is located"
#     type: number
#     sql: ${TABLE}.URBANSIZE ;;
#   }
#
#   dimension: urbrur {
#     label: "Rural or Urban"
#     description: "Household in urban/rural area"
#     type: number
#     sql: ${TABLE}.URBRUR ;;
#   }

#   dimension: vehid {
#     label: "Vehicle ID"
#     description: "Household Vehicle Identifier
# Used on Trip"
#     type: number
#     value_format_name: id
#     sql: ${TABLE}.VEHID ;;
#   }

#   dimension: vmt_mile {
#     label: "Trip Distance for Personal Use"
#     description: "Trip distance in miles for
# personally driven vehicle trips"
#     sql: CASE
#     WHEN ${TABLE}.vmt_mile = -1 THEN "Appropriate skip"
#     ELSE CAST(${TABLE}.vmt_mile AS STRING) END ;;
#   }

#   dimension: whodrove {
#     label: "Person Who Drove"
#     description: "Person Identifier Who Drove
# on Trip"
#     type: number
#     sql: ${TABLE}.WHODROVE ;;
#   }

  dimension: whyfrom {
    label: "Trip Origin Purpose"
    hidden: yes
     case: {
#       when: {
#         sql: ${TABLE}.whyfrom = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.whyfrom = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.whyfrom = -7 ;;
#         label: "I prefer not to answer"
#       }
      when: {
        sql: ${TABLE}.whyfrom = 1 ;;
        label: "Regular home activities (chores, sleep)"
      }
      when: {
        sql: ${TABLE}.whyfrom = 2 ;;
        label: "Work from home (paid)"
      }
      when: {
        sql: ${TABLE}.whyfrom = 3 ;;
        label: "Work"
      }
      when: {
        sql: ${TABLE}.whyfrom = 4 ;;
        label: "Work-related meeting/ trip"
      }
      when: {
        sql: ${TABLE}.whyfrom = 5 ;;
        label: "Volunteer activities (not paid)"
      }
      when: {
        sql: ${TABLE}.whyfrom = 6 ;;
        label: "Drop off /pick up someone"
      }
      when: {
        sql: ${TABLE}.whyfrom = 7 ;;
        label: "Change type of transportation"
      }
      when: {
        sql: ${TABLE}.whyfrom = 8 ;;
        label: "Attend school as a student"
      }
      when: {
        sql: ${TABLE}.whyfrom = 9 ;;
        label: "Attend child care"
      }
      when: {
        sql: ${TABLE}.whyfrom = 10 ;;
        label: "Attend adult care"
      }
      when: {
        sql: ${TABLE}.whyfrom = 11 ;;
        label: "Buy goods (groceries, clothes, appliances, gas)"
      }
      when: {
        sql: ${TABLE}.whyfrom = 12 ;;
        label: "Buy services (dry cleaners, banking, service a car, pet care)"
      }
      when: {
        sql: ${TABLE}.whyfrom = 13 ;;
        label: "Buy meals (go out for a meal, snack, carry-out)"
      }
      when: {
        sql: ${TABLE}.whyfrom = 14 ;;
        label: "Other general errands (post office, library)"
      }
      when: {
        sql: ${TABLE}.whyfrom = 15 ;;
        label: "Recreational activities (visit parks, movies, bars, museums)"
      }
      when: {
        sql: ${TABLE}.whyfrom = 16 ;;
        label: "Exercise (go for a jog, walk, walk the dog, go to the gym)"
      }
      when: {
        sql: ${TABLE}.whyfrom = 17 ;;
        label: "Visit friends or relatives"
      }
      when: {
        sql: ${TABLE}.whyfrom = 18 ;;
        label: "Health care visit (medical, dental, therapy)"
      }
      when: {
        sql: ${TABLE}.whyfrom = 19 ;;
        label: "Religious or other community activities"
      }
      when: {
        sql: ${TABLE}.whyfrom = 97 ;;
        label: "Something else"
      }
      else: "null"
    }
  }

  dimension: whyto {
    label: "Trip Destination Purpose"
    case: {
#       when: {
#         sql: ${TABLE}.whyto = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.whyto = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.whyto = -7 ;;
#         label: "I prefer not to answer"
#       }
      when: {
        sql: ${TABLE}.whyto = 1 ;;
        label: "Regular home activities (chores, sleep)"
      }
      when: {
        sql: ${TABLE}.whyto = 2 ;;
        label: "Work from home (paid)"
      }
      when: {
        sql: ${TABLE}.whyto = 3 ;;
        label: "Work"
      }
      when: {
        sql: ${TABLE}.whyto = 4 ;;
        label: "Work-related meeting/ trip"
      }
      when: {
        sql: ${TABLE}.whyto = 5 ;;
        label: "Volunteer activities (not paid)"
      }
      when: {
        sql: ${TABLE}.whyto = 6 ;;
        label: "Drop off /pick up someone"
      }
      when: {
        sql: ${TABLE}.whyto = 7 ;;
        label: "Change type of transportation"
      }
      when: {
        sql: ${TABLE}.whyto = 8 ;;
        label: "Attend school as a student"
      }
      when: {
        sql: ${TABLE}.whyto = 9 ;;
        label: "Attend child care"
      }
      when: {
        sql: ${TABLE}.whyto = 10 ;;
        label: "Attend adult care"
      }
      when: {
        sql: ${TABLE}.whyto = 11 ;;
        label: "Buy goods (groceries, clothes, appliances, gas)"
      }
      when: {
        sql: ${TABLE}.whyto = 12 ;;
        label: "Buy services (dry cleaners, banking, service a car, pet care)"
      }
      when: {
        sql: ${TABLE}.whyto = 13 ;;
        label: "Buy meals (go out for a meal, snack, carry-out)"
      }
      when: {
        sql: ${TABLE}.whyto = 14 ;;
        label: "Other general errands (post office, library)"
      }
      when: {
        sql: ${TABLE}.whyto = 15 ;;
        label: "Recreational activities (visit parks, movies, bars, museums)"
      }
      when: {
        sql: ${TABLE}.whyto = 16 ;;
        label: "Exercise (go for a jog, walk, walk the dog, go to the gym)"
      }
      when: {
        sql: ${TABLE}.whyto = 17 ;;
        label: "Visit friends or relatives"
      }
      when: {
        sql: ${TABLE}.whyto = 18 ;;
        label: "Health care visit (medical, dental, therapy)"
      }
      when: {
        sql: ${TABLE}.whyto = 19 ;;
        label: "Religious or other community activities"
      }
      when: {
        sql: ${TABLE}.whyto = 97 ;;
        label: "Something else"
      }
      else: "null"
    }
  }

  dimension: WHYTRP1S  {
    label: "Trip Purpose Summary"
    case: {
      when: {
        sql: ${TABLE}.WHYTRP1S  = 1 ;;
        label: "Home"
      }
      when: {
        sql: ${TABLE}.WHYTRP1S  = 10 ;;
        label: "Work"
      }
      when: {
        sql: ${TABLE}.WHYTRP1S  = 20 ;;
        label: "School/Daycare/Religious activity"
      }
      when: {
        sql: ${TABLE}.WHYTRP1S  = 30 ;;
        label: "Medical/Dental services"
      }
      when: {
        sql: ${TABLE}.WHYTRP1S  = 40 ;;
        label: "Shopping/Errands"
      }
      when: {
        sql: ${TABLE}.WHYTRP1S  = 50 ;;
        label: "Social/Recreational"
      }
      when: {
        sql: ${TABLE}.WHYTRP1S  = 70 ;;
        label: "Transport someone"
      }
      when: {
        sql: ${TABLE}.WHYTRP1S  = 80 ;;
        label: "Meals"
      }
      when: {
        sql: ${TABLE}.WHYTRP1S  = 97 ;;
        label: "Something else"
      }
    }
  }

#   dimension: whytrp90 {
#     label: "Travel Day Trip Purpose"
#     description: "Travel day trip purpose
# consistent with 1990 NPTS
# design."
#     type: number
#     sql: ${TABLE}.WHYTRP90 ;;
#   }

#   dimension: worker {
#     label: "Worker Status"
#     type: number
#     sql: ${TABLE}.WORKER ;;
#   }
#
#   dimension: wrkcount {
#     label: "Number of Workers"
#     description: "Number of workers in household"
#     type: number
#     sql: ${TABLE}.WRKCOUNT ;;
#   }``````

  measure: count_trips{
    type: sum
    sql: ${weighted} ;;
    value_format: "0"
    drill_fields: [trptrans, strttime]
  }
}
