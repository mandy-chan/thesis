view: derived_person_cohort {
  derived_table: {
    sql: SELECT households.houseid
          FROM household_travel_data.households AS households

          LEFT JOIN household_travel_data.persons AS persons ON households.houseid = persons.houseid
          LEFT JOIN household_travel_data.trips AS trips ON households.houseid = trips.houseid
              AND persons.personid = trips.personid
          LEFT JOIN household_travel_data.vehicles AS vehicles ON households.houseid = vehicles.houseid
              AND persons.personid = vehicles.personid

          WHERE ({% condition filter_travday %} trips.travday {% endcondition %})
            AND ({% condition filter_trptrans %} trips.trptrans {% endcondition %})
          GROUP BY 1;;
}

dimension: h_id {
  hidden: yes
  primary_key: yes
  description: "Unique ID for each user that has ordered"
  type: number
  sql: ${TABLE}.houseid ;;
}

filter: filter_travday {
  description: "Travel Day to filter cohort - filter on all users that purchased this Travel Day"
  type: number
  suggest_dimension: trips.travday
}

filter: filter_trptrans {
  label: "Filtering on Trip Mode"
  description: "Trip Mode to filter cohort: filtering trips that use this type of transportation"
  type: number
  suggest_dimension: trips.trptrans
}



# filter: cohort_filter_brand_name {
#   description: "Brand Name to filter cohort - filter on all users that purchased this brand"
#   type: string
#   suggest_explore: products
#   suggest_dimension: products.brand_name
# }

}
