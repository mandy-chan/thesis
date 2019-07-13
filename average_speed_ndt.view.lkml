view: average_speed_ndt {
  derived_table: {
    explore_source: national_household_travel_data {
      column: tdcaseid { field: trips.tdcaseid }
      column: average_mph { field: trips.average_mph }
    }
    sql_trigger_value: SELECT 1 ;;
  }
  dimension: tdcaseid {
    label: "Trips Trip ID"
    description: "Unique identifier for every trip
    record in the file"
    type: number
  }
  dimension: average_mph {
    label: "Trips Average Speed"
    value_format: "0"
    type: number
  }
  dimension: tiered_mph {
    type: tier
    tiers: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    style: integer
    sql: ${average_mph} ;;
  }
}
