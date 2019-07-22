view: avg_distance_per_trip_mode{
  derived_table: {
    sql_trigger_value: SELECT 1 ;;
    sql:
    SELECT
    trips.tdcaseid AS tdcaseid,
    trips.trpmiles,
    trips.WTTRDFIN,
    trips.trvlcmin,
    trips.trptrans,
    COUNT(*) as count,
    AVG((trips.trpmiles*WTTRDFIN)/(count(*)*WTTRDFIN)) OVER
    (PARTITION BY trips.trptrans ORDER BY trips.trptrans ASC) AS average_distance_per_trip_mode
    FROM household_travel_data.trips AS trips

    WHERE trips.trvlcmin > 0 AND trips.trptrans > 0

    GROUP BY 1,2,3,4,5
    ORDER BY 6 ASC

    ;;

    }

    dimension: tdcaseid {
      primary_key: yes
      hidden: yes
      type: number
      sql: ${TABLE}.tdcaseid ;;
    }


    dimension: average_distance_per_trip_mode {
      type: number
      sql: ${TABLE}.average_distance_per_trip_mode ;;
      value_format: "0.00"
    }

  }
