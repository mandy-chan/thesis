view: speed_ntile {
  derived_table: {
    sql_trigger_value: SELECT 1 ;;
    sql:
      SELECT tdcaseid,
             (trpmiles/trvlcmin)*60) as mph,
             NTILE(10) OVER (ORDER BY 2) as decile FROM household_travel_data.trips
             WHERE trvlcmin > 0 AND trpmiles > 0
      ;;
  }

  dimension: tdcaseid {
    primary_key: yes
    type: number
    sql: ${TABLE}.tdcaseid ;;
  }

  dimension: decile {
    type: number
    sql: ${TABLE}.decile ;;
  }
}
