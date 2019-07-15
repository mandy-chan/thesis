view: derived_person_cohort {
  derived_table: {
    sql: SELECT trips.tdcaseid AS trips_id,
                COUNT(*) as cohort_size

          FROM household_travel_data.trips AS trips
          LEFT JOIN household_travel_data.households AS households ON households.houseid = trips.houseid
          LEFT JOIN household_travel_data.persons AS persons ON households.houseid = persons.houseid
            AND persons.personid = trips.personid
          LEFT JOIN household_travel_data.vehicles AS vehicles ON households.houseid = vehicles.houseid
              AND persons.personid = vehicles.personid

          WHERE ({% condition filter_miles %} trips.trpmiles {% endcondition %})
            AND ({% condition filter_trptrans %} trips.trptrans {% endcondition %})
          GROUP BY 1;;
}

dimension: trips_id {
  hidden: yes
  primary_key: yes
  description: "Unique trip ID"
  type: number
  sql: ${TABLE}.trips_id ;;
}

filter: filter_miles {
  description: "Travel Day to filter cohort - filter on all users that purchased this Travel Day"
  type: number
  suggest_dimension: trips.trpmiles
}

filter: filter_trptrans {
  label: "Filtering on Trip Mode"
  description: "Trip Mode to filter cohort: filtering trips that use this type of transportation"
  type: number
  suggest_dimension: trips.trptrans
}

  dimension: cohort_size {
    type: number
  }

  measure: total_cohort_size {
    type: sum
    sql: ${cohort_size} ;;
  }

  measure: total_revenue_over_total_cohort_size {
    type: number
    sql: ${trips.total_trip_miles}/ ${total_cohort_size} ;;
    value_format: "0"
  }

  parameter: measure_picker {
    type: string
    allowed_value: { value: "Car" }
    allowed_value: { value: "SUV" }
    allowed_value: { value: "Walk" }
    allowed_value: { value: "Bike" }
  }

  measure: cohort_values {
    type: number
    hidden: yes
    sql: CASE WHEN {% parameter measure_picker %} = 'Car' THEN ${trips.trpmiles}
        WHEN {% parameter measure_picker %} = 'SUV' THEN ${total_cohort_size}
        WHEN {% parameter measure_picker %} = 'Walk' THEN ${total_revenue_over_total_cohort_size}
        WHEN {% parameter measure_picker %} = 'Bike' THEN ${cohort_size}
        ELSE 0
      END ;;
  }
}
