view: sorting_by_pivot {
  derived_table: {
    sql_trigger_value: SELECT 1 ;;
    sql:
    SELECT
    trips.tdcaseid AS trip_id,
    trips.trvlcmin AS trip_duration_min,
    COUNT(trips.strttime) AS count_of_trips, /* Included for clarity */
    DENSE_RANK() OVER (ORDER BY COUNT(trips.strttime) ASC) AS ranking
    FROM household_travel_data.trips AS trips
    WHERE trips.trvlcmin > 0

    GROUP BY 1,2
    ORDER BY 2 DESC

    ;;

    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: trip_id {
      primary_key: yes
      hidden: yes
      type: number
      sql: ${TABLE}.trip_id ;;
    }

    dimension: trip_duration_min {
      type: string
      sql: ${TABLE}.trip_duration_min ;;
    }

    dimension: count_of_trips {
      type: number
      sql: ${TABLE}.count_of_trips ;;
    }

    dimension: ranking {
      type: number
      sql: ${TABLE}.ranking ;;
    }

    set: detail {
      fields: [trip_duration_min, count_of_trips, ranking]
    }

}
