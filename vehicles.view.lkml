view: vehicles {
  sql_table_name: household_travel_data.vehicles ;;

  dimension: person_of_household {
    sql: CONCAT(CAST(${TABLE}.HOUSEID AS STRING), '-', CAST(${TABLE}.PERSONID AS STRING)) ;;
  }

  dimension: household_vehicle {
    sql: CONCAT(CAST(${TABLE}.HOUSEID AS STRING), '-', CAST(${TABLE}.VEHID AS STRING)) ;;
    primary_key: yes
    hidden: yes
  }

  dimension: houseid {
    hidden: yes
    label: "House ID"
    type: number
    sql: ${TABLE}.HOUSEID ;;
  }

#   dimension: annmiles {
#     label: "Self-Reported Annual Miles"
#     description: "Self-reported annualized mile
# estimate"
#     type: number
#     sql: ${TABLE}.ANNMILES ;;
#   }

#   dimension: best_edt {
#     description: "Flag any edits/adjustments to
# BESTMILE"
#     type: number
#     sql: ${TABLE}.BEST_EDT ;;
#   }

#   dimension: best_flg {
#     label: "How Best Mile Was Computed"
#     type: number
#     sql: ${TABLE}.BEST_FLG ;;
#   }

#   dimension: best_out {
#     description: "Flag identifying BESTMILE
# outlier values"
#     type: number
#     sql: ${TABLE}.BEST_OUT ;;
#   }

  dimension: bestmile {
    label: "Annual Miles (Estimate)"
    description: "Best estimate of annual miles"
    sql: CASE
    WHEN ${TABLE}.bestmile >= 0 THEN ${TABLE}.bestmile
    ELSE null END ;;
  }

  measure: average_bestmiles {
    label: "Average of Miles Driven"
    type: average
    sql: ${bestmile} ;;
    value_format: "0.00"
  }

#   dimension: cdivmsar {
#     label: "Household Grouping"
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
#
#   dimension: drvrcnt {
#     label: "Number of Drivers"
#     description: "Number of drivers in household"
#     type: number
#     sql: ${TABLE}.DRVRCNT ;;
#   }

  dimension: fueltype {
    label: "Fuel Type"
    case: {
#       when: {
#         sql: ${TABLE}.fueltype = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.fueltype = -7 ;;
#         label: "I prefer not to answer"
#       }
      when: {
        sql: ${TABLE}.fueltype = 1 ;;
        label: "Gas"
      }
      when: {
        sql: ${TABLE}.fueltype = 2 ;;
        label: "Diesel"
      }
      when: {
        sql: ${TABLE}.fueltype = 3 ;;
        label: "Hybrid, electric or alternative fuel"
      }
      when: {
        sql: ${TABLE}.fueltype = 97 ;;
        label: "Some other fuel"
      }
      else: "null"
    }
  }

#   dimension: hbhtnrnt {
#     description: "Category of the percent of renter-occupied housing in the census block group of the household's home location"
#     type: number
#     sql: ${TABLE}.HBHTNRNT ;;
#   }

#   dimension: hbhur {
#     label: "Urban / Rural indicator - Block Group"
#     type: string
#     sql: ${TABLE}.HBHUR ;;
#   }

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

  dimension: hfuel {
    label: "Type of Hybrid Vehicle"
    case: {
#       when: {
#         sql: ${TABLE}.hfuel = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.hfuel = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.hfuel = -1 ;;
#         label: "Appropriate skip"
#       }
      when: {
        sql: ${TABLE}.hfuel = 1 ;;
        label: "Biodiesel"
      }
      when: {
        sql: ${TABLE}.hfuel = 2 ;;
        label: "Plug-in Hybrid (gas/electric e.g., Chevy Volt)"
      }
      when: {
        sql: ${TABLE}.hfuel = 3 ;;
        label: "Electric (e.g. Nissan Leaf)"
      }
      when: {
        sql: ${TABLE}.hfuel = 4 ;;
        label: "Hybrid (gas/electric, not plug-in e.g., Toyota Prius)"
      }
      when: {
        sql: ${TABLE}.hfuel = 97 ;;
        label: "Some other fuel"
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

#   dimension: hhsize {
#     label: "Number of Household Members"
#     type: number
#     sql: ${TABLE}.HHSIZE ;;
#   }
#
#   dimension: hhstate {
#     label: "Household State"
#     type: string
#     sql: ${TABLE}.HHSTATE ;;
#   }

#   dimension: hhstfips {
#     label: "State FIPS"
#     description: "State FIPS for household address"
#     type: number
#     sql: ${TABLE}.HHSTFIPS ;;
#   }

  dimension: hhvehcnt {
    label: "Count of Household Vehicles"
    type: number
    sql: ${TABLE}.HHVEHCNT ;;
  }

#   dimension: homeown {
#     label: "Home Ownership"
#     type: number
#     sql: ${TABLE}.HOMEOWN ;;
#   }

#   dimension: hteempdn {
#     label: "Workers Per Square Mile"
#     description: "Category of workers per square mile in the census tract of the household's home location"
#     type: number
#     sql: ${TABLE}.HTEEMPDN ;;
#   }
#
#   dimension: hthtnrnt {
#     label: "Renter-Occupied Housing"
#     description: "Category of the percent of renter-occupied housing in the census tract of the household's home location"
#     type: number
#     sql: ${TABLE}.HTHTNRNT ;;
#   }
#
#   dimension: htppopdn {
#     label: "Population Density"
#     description: "Category of population density (persons per square mile) in the census tract of the household's home location"
#     type: number
#     sql: ${TABLE}.HTPPOPDN ;;
#   }

#   dimension: htresdn {
#     label: "Housing Units Per Square Mile"
#     description: "Category of housing units per square mile in the census tract of the household's home location"
#     type: number
#     sql: ${TABLE}.HTRESDN ;;
#   }

  dimension: hybrid {
    label: "Hybrid Vehicle"
    case: {
      when: {
        sql: ${TABLE}.hybrid = 1 ;;
        label: "Yes"
      }
      when: {
        sql: ${TABLE}.hybrid = 2 ;;
        label: "No"
      }
    }
  }

#   dimension: lif_cyc {
#     label: "Life Cycle Classification"
#     description: "Life Cycle classification for the household, derived by attributes pertaining to age, relationship, and work status"
#     type: number
#     sql: ${TABLE}.LIF_CYC ;;
#   }

#   dimension: make {
#     label: "Vehicle Make"
#     type: string
#     sql: ${TABLE}.MAKE ;;
#   }
#
#   dimension: model {
#     label: "Vehicle Model"
#     type: string
#     sql: ${TABLE}.MODEL ;;
#   }

#   dimension: msacat {
#     label: "MSA Category"
#     description: "Metropolitan Statistical Area (MSA) category for the household's home address, based on household's home "
#     type: number
#     sql: ${TABLE}.MSACAT ;;
#   }
#
#   dimension: msasize {
#     label: "Population Size Category"
#     description: "Population size category of the Metropolitan Statistical Area (MSA), from the 2010-2014 five-year American Community Survey (ACS) API."
#     type: number
#     sql: ${TABLE}.MSASIZE ;;
#   }
#
#   dimension: numadlt {
#     label: "Number of Adult Members"
#     description: "Count of adult household members at least 18 years old"
#     type: number
#     sql: ${TABLE}.NUMADLT ;;
#   }

#   dimension: od_read {
#     label: "Odometer Reading"
#     type: number
#     sql: ${TABLE}.OD_READ ;;
#   }

  dimension: personid {
    label: "Person ID"
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.PERSONID ;;
  }

#   dimension: rail {
#     label: "Rail Status"
#     description: "MSA heavy rail status for household"
#     type: number
#     sql: ${TABLE}.RAIL ;;
#   }

#   dimension: smplsrce {
#     description: "Sample where the case
# originated"
#     type: number
#     sql: ${TABLE}.SMPLSRCE ;;
#   }

#   dimension: tdaydate {
#     label: "Travel Date (YYYYMM)"
#     type: number
#     sql: ${TABLE}.TDAYDATE ;;
#   }

#   dimension: travday {
#     label: "Weekday"
#     type: number
#     sql: ${TABLE}.TRAVDAY ;;
#   }
#
#   dimension: urban {
#     label: "Urban Area Classification"
#     description: "Household's urban area classification, based on home address and 2014 TIGER/Line Shapefile"
#     type: number
#     sql: ${TABLE}.URBAN ;;
#   }
#
#   dimension: urbansize {
#     label: "Urban Area Size"
#     description: "Urban area size where home address is located"
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

  dimension: vehage {
    label: "Vehicle Age"
    description: "Age of vehicle, based on
model year"
    sql: CASE
    WHEN ${TABLE}.vehage >= 0 THEN CAST(${TABLE}.vehage AS STRING)
    ELSE null END ;;
  }

  dimension: vehid {
    label: "Vehicle ID"
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.VEHID ;;
  }

  dimension: vehowned {
    label: "Own Vehicle > 1 yr"
    description: "Owned Vehicle Longer than a
Year"
    case: {
#       when: {
#         sql: ${TABLE}.vehowned = -9 ;;
#         label: "Not ascertained"
#       }
#       when: {
#         sql: ${TABLE}.vehowned = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.vehowned = -7 ;;
#         label: "I prefer not to answer"
#       }
      when: {
        sql: ${TABLE}.vehowned = 1 ;;
        label: "Yes"
      }
      when: {
        sql: ${TABLE}.vehowned = 2 ;;
        label: "No"
      }
      else: "null"
    }
  }

  dimension: vehownmo {
    label: "Vehicle Ownership (months)"
    description: "Months of Vehicle Ownership"
    sql: CASE
    WHEN ${TABLE}.vehownmo >=0 THEN CAST(${TABLE}.vehownmo AS STRING)
    ELSE null END ;;
  }

  dimension: vehtype {
    label: "Vehicle Type"
    case: {
#       when: {
#         sql: ${TABLE}.vehtype = -8 ;;
#         label: "I don't know"
#       }
#       when: {
#         sql: ${TABLE}.vehtype = -7 ;;
#         label: "I prefer not to answer"
#       }
      when: {
        sql: ${TABLE}.vehtype = 1 ;;
        label: "Automobile/Car/Station Wagon"
      }
      when: {
        sql: ${TABLE}.vehtype = 2 ;;
        label: "Van (Mini/Cargo/Passenger)"
      }
      when: {
        sql: ${TABLE}.vehtype = 3 ;;
        label: "SUV (Santa Fe, Tahoe, Jeep, etc.)"
      }
      when: {
        sql: ${TABLE}.vehtype = 4 ;;
        label: "Pickup Truck"
      }
      when: {
        sql: ${TABLE}.vehtype = 5 ;;
        label: "Other Truck"
      }
      when: {
        sql: ${TABLE}.vehtype = 6 ;;
        label: "RV (Recreational Vehicle)"
      }
      when: {
        sql: ${TABLE}.vehtype = 7 ;;
        label: "Motorcycle/Motorbike"
      }
      when: {
        sql: ${TABLE}.vehtype = 97 ;;
        label: "Something else"
      }
      else: "null"
    }
  }

#   dimension: vehyear {
#     label: "Vehicle Year"
#     type: number
#     sql: ${TABLE}.VEHYEAR ;;
#   }

#   dimension: whomain {
#     label: "Vehicle Main Driver"
#     type: number
#     sql: ${TABLE}.WHOMAIN ;;
#   }

#   dimension: wrkcount {
#     label: "Number of Workers"
#     description: "Number of workers in household"
#     type: number
#     sql: ${TABLE}.WRKCOUNT ;;
#   }

  measure: count {
    type: count
    drill_fields: [persons.personid]
  }
}
