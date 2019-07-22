view: count_households {

  derived_table: {

    sql_trigger_value: SELECT 1 ;;
    sql:  SELECT COUNT(*) as count_households
          FROM household_travel_data.households
          ;;

    }

    dimension: count_households {
      type: number
      sql: ${TABLE}.count_households ;;
    }
}
