view: count_vehicles {
  derived_table: {

    sql_trigger_value: SELECT 1 ;;
    sql:  SELECT COUNT(*) as count_vehicles
          FROM household_travel_data.vehicles
          ;;

    }

    dimension: count_vehicles {
      type: number
      sql: ${TABLE}.count_vehicles ;;
    }
  }
