view: sorting_by_pivot {
  derived_table: {
    sql_trigger_value: SELECT 1 ;;
    sql:
    SELECT
    households.houseid AS houseid,
    households.hhvehcnt AS count_of_households_vehicle,
    COUNT(households.hhvehcnt) AS count_of_trips, /* Included for clarity */
    DENSE_RANK() OVER (ORDER BY households.hhvehcnt ASC) AS ranking
    FROM household_travel_data.households AS households

    GROUP BY 1,2
    ORDER BY 2 DESC

    ;;

    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: houseid {
      primary_key: yes
      hidden: yes
      type: number
      sql: ${TABLE}.houseid ;;
    }

    dimension: count_of_households_vehicle {
      type: string
      sql: ${TABLE}.count_of_households_vehicle ;;
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
      fields: [count_of_households_vehicle, count_of_trips, ranking]
    }

}
