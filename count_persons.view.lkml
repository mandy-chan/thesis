view: count_persons {
  derived_table: {

    sql_trigger_value: SELECT 1 ;;
    sql:  SELECT COUNT(*) as count_persons
          FROM household_travel_data.persons
          ;;

    }

    dimension: count_persons {
      type: number
      sql: ${TABLE}.count_persons ;;
    }
  }
