view: hacker_news {
  sql_table_name: reporting.hacker_news ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: by {
    type: string
    sql: ${TABLE}.`by` ;;
  }

  dimension: content_sentiment {
    type: string
    sql: ${TABLE}.content_sentiment ;;
  }

  dimension: descendants {
    type: number
    sql: ${TABLE}.descendants ;;
  }

  dimension_group: ds {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.ds ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: text {
    type: number
    sql: ${TABLE}.text ;;
  }

  dimension: time {
    type: number
    sql: ${TABLE}.time ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: title_sentiment {
    type: string
    sql: ${TABLE}.title_sentiment ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
