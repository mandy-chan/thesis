view: households {
  sql_table_name: household_travel_data.households ;;

#   dimension: bike {
#     type: number
#     sql: ${TABLE}.BIKE ;;
#   }
#
#   dimension: bike2save {
#     type: number
#     sql: ${TABLE}.BIKE2SAVE ;;
#   }
#
#   dimension: bus {
#     type: number
#     sql: ${TABLE}.BUS ;;
#   }
#   dimension: car {
#     type: number
#     sql: ${TABLE}.CAR ;;
#   }
#
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
#
#   dimension: cnttdhh {
#     type: number
#     sql: ${TABLE}.CNTTDHH ;;
#   }
#
#   dimension: drvrcnt {
#     type: number
#     sql: ${TABLE}.DRVRCNT ;;
#   }
#
#   dimension: hbhtnrnt {
#     type: number
#     sql: ${TABLE}.HBHTNRNT ;;
#   }
#
#   dimension: hbhur {
#     type: string
#     sql: ${TABLE}.HBHUR ;;
#   }
#
#   dimension: hbppopdn {
#     type: number
#     sql: ${TABLE}.HBPPOPDN ;;
#   }
#
#   dimension: hbresdn {
#     type: number
#     sql: ${TABLE}.HBRESDN ;;
#   }
#
#   dimension: hh_cbsa {
#     type: string
#     sql: ${TABLE}.HH_CBSA ;;
#   }
#
#   dimension: hh_hisp {
#     type: number
#     sql: ${TABLE}.HH_HISP ;;
#   }
#
#   dimension: hh_race {
#     type: number
#     sql: ${TABLE}.HH_RACE ;;
#   }

  dimension: hhfaminc {
    hidden: yes
    label: "Household income"
    case: {
      when: {
        sql: ${TABLE}.hhfaminc = 1  ;;
        label: "<$10,000"
      }
      when: {
        sql: ${TABLE}.hhfaminc = 2 ;;
        label: "$10,000 to $14,999"
      }
      when: {
        sql: ${TABLE}.hhfaminc = 3 ;;
        label: "$15,000 to $24,999"
      }
      when: {
        sql: ${TABLE}.hhfaminc = 4 ;;
        label: "$25,000 to $34,999"
      }
      when: {
        sql: ${TABLE}.hhfaminc = 5 ;;
        label: "$35,000 to $49,999"
      }
      when: {
        sql: ${TABLE}.hhfaminc = 6 ;;
        label: "$50,000 to $74,999"
      }
      when: {
        sql: ${TABLE}.hhfaminc = 7 ;;
        label: "$75,000 to $99,999"
      }
      when: {
        sql: ${TABLE}.hhfaminc = 8 ;;
        label: "$100,000 to $124,999"
      }
      when: {
        sql: ${TABLE}.hhfaminc = 9 ;;
        label: "$125,000 to $149,999"
      }
      when: {
        sql: ${TABLE}.hhfaminc = 10 ;;
        label: "$150,000 to $199,999"
      }
      when: {
        sql: ${TABLE}.hhfaminc = 11 ;;
        label: ">$200,000"
      }
      else: "n/a"
    }
  }

  dimension: hhfaminc_2 {
    label: "Household income"
    case: {
      when: {
        sql: ${TABLE}.hhfaminc BETWEEN 1 AND 3  ;;
        label: "<$24,999"
      }
      when: {
        sql: ${TABLE}.hhfaminc BETWEEN 4 AND 5 ;;
        label: "$25,000 to $49,999"
      }
      when: {
        sql: ${TABLE}.hhfaminc BETWEEN 6 AND 7 ;;
        label: "$50,000 to $99,999"
      }
      when: {
        sql: ${TABLE}.hhfaminc BETWEEN 8 AND 9 ;;
        label: "$100,000 to $149,999"
      }
      when: {
        sql: ${TABLE}.hhfaminc BETWEEN 10 AND 11;;
        label: ">$150,000"
      }
      else: "n/a"
    }
  }

#   dimension: hhrelatd {
#     type: number
#     sql: ${TABLE}.HHRELATD ;;
#   }
#
#   dimension: hhresp {
#     type: number
#     sql: ${TABLE}.HHRESP ;;
#   }

  dimension: hhsize {
    label: "Count of household members"
    type: number
    sql: ${TABLE}.HHSIZE ;;
  }

  dimension: hhstate {
    label: "Household state"
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.HHSTATE ;;
    link: {
      label: "Use of Privately Owned Vehicles"
      url: "/dashboards/335?State={{ value | url_encode }}"
  }
  }

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

  dimension: houseid {
    label: "House ID"
    hidden: yes
    primary_key: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.HOUSEID ;;
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

#   dimension: msasize {
#     label: "Population size in a MSA"
#     description: "Population size category of the
# Metropolitan Statistical Area
# (MSA), from the 2010-2014
# five-year American Community
# Survey (ACS) API."
#     case: {
#       when: {
#         sql: ${TABLE}.msasize = 1;;
#         label: "In an MSA of Less than 250,000"
#       }
#       when: {
#         sql: ${TABLE}.msasize = 2;;
#         label: "In an MSA of 250,000 - 499,999"
#       }
#       when: {
#         sql: ${TABLE}.msasize = 3;;
#         label: "In an MSA of 500,000 - 999,999"
#       }
#       when: {
#         sql: ${TABLE}.msasize = 4;;
#         label: "In an MSA or CMSA of 1,000,000 - 2,999,999"
#       }
#       when: {
#         sql: ${TABLE}.msasize = 5;;
#         label: "In an MSA or CMSA of 3 million or more"
#       }
#       when: {
#         sql: ${TABLE}.msasize = 6;;
#         label: "Not in MSA or CMSA"
#       }
#     else: "null"
#     }
#   }

#   dimension: msacat {
#     type: number
#     sql: ${TABLE}.MSACAT ;;
#   }

#   dimension: numadlt {
#     type: number
#     sql: ${TABLE}.NUMADLT ;;
#   }
#
#   dimension: para {
#     type: number
#     sql: ${TABLE}.PARA ;;
#   }
#
#   dimension: pc {
#     type: number
#     sql: ${TABLE}.PC ;;
#   }
#
#   dimension: place {
#     type: number
#     sql: ${TABLE}.PLACE ;;
#   }
#
#   dimension: price {
#     label: "Gasoline prices affect travel"
#     case: {
#       when: {
#         sql: ${TABLE}.price = 1 ;;
#         label: "Strongly agree"
#       }
#       when: {
#         sql: ${TABLE}.price = 2 ;;
#         label: "Agree"
#       }
#       when: {
#         sql: ${TABLE}.price = 3 ;;
#         label: "Neither Agree or Disagree"
#       }
#       when: {
#         sql: ${TABLE}.price = 4 ;;
#         label: "Disagree"
#       }
#       when: {
#         sql: ${TABLE}.price = 5 ;;
#         label: "Strongly disagree"
#       }
#       else: "null"
#     }
#   }
#
#   dimension: ptrans {
#     type: number
#     sql: ${TABLE}.PTRANS ;;
#   }
#
#   dimension: rail {
#     type: number
#     sql: ${TABLE}.RAIL ;;
#   }
#
#   dimension: resp_cnt {
#     type: number
#     sql: ${TABLE}.RESP_CNT ;;
#   }
#
#   dimension: scresp {
#     type: number
#     sql: ${TABLE}.SCRESP ;;
#   }
#
#   dimension: smplsrce {
#     type: number
#     sql: ${TABLE}.SMPLSRCE ;;
#   }
#
#   dimension: sphone {
#     type: number
#     sql: ${TABLE}.SPHONE ;;
#   }
#
#   dimension: tab {
#     type: number
#     sql: ${TABLE}.TAB ;;
#   }
#
#   dimension: taxi {
#     type: number
#     sql: ${TABLE}.TAXI ;;
#   }

#   dimension: tdaydate {
#     type: number
#     sql: ${TABLE}.TDAYDATE ;;
#   }

#   dimension: train {
#     type: number
#     sql: ${TABLE}.TRAIN ;;
#   }

#   dimension: travday {
#     type: number
#     sql: ${TABLE}.TRAVDAY ;;
#   }

#   dimension: urban {
#     type: number
#     sql: ${TABLE}.URBAN ;;
#   }
#
#   dimension: urbansize {
#     label: "Urban Size"
#     description: "Urban area size where home
# address is located"
#     case: {
#       when: {
#         sql: ${TABLE}.urbansize = 1 ;;
#         label: "50,000 - 199,999"
#       }
#       when: {
#         sql: ${TABLE}.urbansize = 2 ;;
#         label: "200,000 - 499,999"
#       }
#       when: {
#         sql: ${TABLE}.urbansize = 3 ;;
#         label: "500,000 - 999,999"
#       }
#       when: {
#         sql: ${TABLE}.urbansize = 4 ;;
#         label: "1 million or more without heavy rail"
#       }
#       when: {
#         sql: ${TABLE}.urbansize = 5 ;;
#         label: "1 million or more with heavy rail"
#       }
#       when: {
#         sql: ${TABLE}.urbansize = 6 ;;
#         label: "Not in an urbanized area"
#       }
#     }
#   }

  dimension: urbrur {
    label: "Rural or Urban"
    case: {
      when: {
        sql: ${TABLE}.urbrur = 1 ;;
        label: "Urban"
      }
      else: "Rural"
    }
  }

#   dimension: walk {
#     type: number
#     sql: ${TABLE}.WALK ;;
#   }
#
#   dimension: walk2save {
#     type: number
#     sql: ${TABLE}.WALK2SAVE ;;
#   }
#
#   dimension: webuse17 {
#     type: number
#     sql: ${TABLE}.WEBUSE17 ;;
#   }
#
#   dimension: wrkcount {
#     type: number
#     sql: ${TABLE}.WRKCOUNT ;;
#   }

  dimension: wthhfin {
    hidden: yes
    type: number
    sql: ${TABLE}.WTHHFIN ;;
  }

  measure: count_household {
    type: sum
    sql: ${wthhfin} ;;
    value_format: "0"
    drill_fields: [hhstate]
  }

#   dimension: youngchild {
#     type: number
#     sql: ${TABLE}.YOUNGCHILD ;;
#   }

}
