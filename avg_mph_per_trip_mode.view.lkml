view: avg_mph_per_trip_mode{
  derived_table: {
    sql_trigger_value: SELECT 1 ;;
    sql:
    SELECT
    trips.tdcaseid AS tdcaseid,
    trips.trpmiles,
    trips.WTTRDFIN,
    trips.trvlcmin,
    trips.trptrans,
    trips.strttime,
    (SUM(trips.trpmiles*WTTRDFIN))/(SUM(trips.WTTRDFIN)) AS weight_miles,
    (SUM((trips.trvlcmin/60)*WTTRDFIN))/(SUM(trips.WTTRDFIN)) AS weight_minutes,
    AVG(((SUM(trips.trpmiles*WTTRDFIN))/(SUM(trips.WTTRDFIN))) / ((SUM((trips.trvlcmin/60)*WTTRDFIN))/(SUM(trips.WTTRDFIN)))) OVER
    (PARTITION BY trips.strttime ORDER BY trips.strttime ASC) AS average_mph_per_trip_mode
    FROM household_travel_data.trips AS trips

    WHERE trips.trvlcmin > 0 AND trips.trptrans > 0

    GROUP BY 1,2,3,4,5,6
    ORDER BY 6 ASC

    ;;

    }

#     measure: count {
#       type: count
#       drill_fields: [detail*]
#     }
#
    dimension: tdcaseid {
      primary_key: yes
      hidden: yes
      type: number
      sql: ${TABLE}.tdcaseid ;;
    }
#
#     dimension: count_of_trips {
#       type: number
#       sql: ${TABLE}.count_of_trips ;;
#     }

    dimension: weight_miles {
      type: number
      sql: ${TABLE}.weight_miles;;
    }

  dimension: weight_minutes{
    type: number
    sql: ${TABLE}.weight_minutes;;
  }


    dimension: average_mph_per_trip_mode {
      type: number
      sql: ${TABLE}.average_mph_per_trip_mode ;;
      value_format: "0.00"
    }
#
#     set: detail {
#       fields: [count_of_trips, average_mph_per_trip_mode]
#     }

}
