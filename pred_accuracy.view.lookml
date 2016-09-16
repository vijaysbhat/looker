
- view: pred_accuracy
  derived_table:
    sql: |
      SELECT 
        DATE(hacker_news.ds) AS `hacker_news.ds_date`,
        hacker_news.title_sentiment AS `hacker_news.title_sentiment`,
        1.0 * SUM(IF(hacker_news.content_sentiment = hacker_news.title_sentiment, 1, 0))/COUNT(*) AS pred_accuracy
      FROM reporting.hacker_news AS hacker_news
      
      GROUP BY 1,2
      ORDER BY DATE(hacker_news.ds) DESC
      LIMIT 500

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: hacker_news_ds_date
    type: date
    sql: ${TABLE}.`hacker_news.ds_date`

  - dimension: hacker_news_title_sentiment
    type: string
    sql: ${TABLE}.`hacker_news.title_sentiment`

  - measure: pred_accuracy
    type: number
    sql: ${TABLE}.pred_accuracy

  sets:
    detail:
      - hacker_news_ds_date
      - hacker_news_title_sentiment
      - pred_accuracy

