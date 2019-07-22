view: count_trips {
  derived_table: {

    sql_trigger_value: SELECT 1 ;;
    sql:  SELECT COUNT(*) as count_trips
          FROM household_travel_data.trips
          ;;

  }

  dimension: count_trips {
    type: number
    sql: ${TABLE}.count_trips ;;
  }
}
