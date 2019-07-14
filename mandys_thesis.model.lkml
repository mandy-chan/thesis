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
#   sql_always_where: ${households.hhfaminc} != "null" AND
#                     ${trips.whyto} != "null" AND
#                     ${households.price} != "null" AND
#                     ${vehicles.fueltype} != "null" AND
#                     ${persons.ptused} is not null AND
#                     ${trips.trpmiles} is not null AND
#                     ${trips.trptrans} != "null" AND
#                     ${trips.strttime} != "null" AND
#                     ${trips.endtime} != "null" AND
#                     ${trips.trvlcmin} is not null AND ${trips.trvlcmin} > 0 AND
#                     ${persons.walk_def} != "null" AND
#                     ${persons.bike_dfr} != "null" AND
#                     ${persons.bike_gkp} != "null" AND ${persons.walk_gkq} != "null"
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

  join: average_speed_ndt {
    type: left_outer
    sql_on: ${average_speed_ndt.tdcaseid} = ${trips.tdcaseid} ;;
    relationship: one_to_one
  }

  join: vehicles {
    type: left_outer
    relationship: one_to_many
    sql_on: ${households.houseid} = ${vehicles.houseid} AND ${persons.personid} = ${vehicles.personid} ;;
  }

  join: derived_person_cohort {
    view_label: "Cohort Filters"
    type: inner
    relationship: one_to_one
    sql_on: ${households.houseid} = ${derived_person_cohort.h_id};;
  }

  join: sorting_by_pivot {
    type: inner
    relationship: one_to_one
    sql_on: ${trips.tdcaseid} = ${sorting_by_pivot.trip_id} ;;
  }

}
