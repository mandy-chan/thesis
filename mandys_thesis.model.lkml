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
  sql_always_where: ${households.hhfaminc} != "null" AND
                    ${trips.whyto} != "null"


  ;;

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

}
