connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "*.view"

datagroup: mandys_thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: mandys_thesis_default_datagroup


explore: national_household_travel_data {
  view_name: households
    sql_always_where: ${trips.trvlcmin} > 0 ;;
#   sql_always_where: ${households.hhfaminc} != "null" OR
#                     ${trips.whyto} != "null" OR
#                     ${households.price} != "null" OR
#                     ${vehicles.fueltype} != "null" OR
#                     ${persons.ptused} is not null OR
#                     ${trips.trpmiles} is not null OR
#                     ${trips.trptrans} != "null" OR
#                     ${trips.strttime} != "null" OR
#                     ${trips.endtime} != "null" OR
#                     ${trips.trvlcmin} != "null" OR
#                     ${trips.trvlcmin} > 0 OR
#                     ${persons.wrktrans} != "null" OR
#                     ${persons.bike_dfr} != "null" OR
#                     ${persons.bike_gkp} != "null" OR
#                     ${persons.walk_gkq} != "null"
#   ;;

  join: persons {
    type: left_outer
    relationship: one_to_many
    sql_on: ${households.houseid} = ${persons.houseid};;
  }

  join: trips {
    type: left_outer
    relationship: many_to_many
    sql_on: ${households.houseid} = ${trips.houseid} AND ${persons.personid} = ${trips.personid} ;;
  }

  join: vehicles {
    type: left_outer
    relationship: one_to_many
    sql_on: ${households.houseid} = ${vehicles.houseid} AND ${persons.personid} = ${vehicles.personid} ;;
  }

  join: avg_mph_per_trip_mode {
    type: inner
    relationship: one_to_one
    sql_on: ${trips.tdcaseid} = ${avg_mph_per_trip_mode.tdcaseid} ;;
  }

  join: avg_distance_per_trip_mode {
    type: inner
    relationship: one_to_one
    sql_on: ${trips.tdcaseid} = ${avg_distance_per_trip_mode.tdcaseid} ;;
  }

  join: avg_duration_per_trip_mode {
    type: inner
    relationship: one_to_one
    sql_on: ${trips.tdcaseid} = ${avg_duration_per_trip_mode.tdcaseid} ;;
  }

}
