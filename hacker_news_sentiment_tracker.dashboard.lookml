- dashboard: hacker_news_sentiment_tracker
  title: Hacker News Sentiment Tracker
  layout: grid
  rows:
    - elements: [today_headline_sentiment, today_content_sentiment, prediction_accuracy]
      height: 400
    - elements: [headline_sentiment_trend, content_sentiment_trend]
      height: 400

#  filters:

  elements:

  - name: today_headline_sentiment
    title: Headline Sentiment
    type: looker_donut_multiples
    model: hacker_news_sentiment_tracker
    explore: hacker_news
    dimensions: [hacker_news.ds_date, hacker_news.title_sentiment]
    pivots: [hacker_news.title_sentiment]
    measures: [hacker_news.count]
    filters:
      hacker_news.ds_date: 2 days
    sorts: [hacker_news.ds_date desc, hacker_news.title_sentiment]
    limit: '500'
    column_limit: '50'
    query_timezone: America/Los_Angeles
    show_value_labels: true
    font_size: 12
    show_view_names: true
    value_labels: legend
    label_type: labPer
    stacking: ''
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    colors: ['#d5e2e6', '#c1340c', '#61a5a4', '#2c8912']

  - name: today_content_sentiment
    title: Content Sentiment
    type: looker_donut_multiples
    model: hacker_news_sentiment_tracker
    explore: hacker_news
    dimensions: [hacker_news.ds_date, hacker_news.content_sentiment]
    pivots: [hacker_news.content_sentiment]
    measures: [hacker_news.count]
    filters:
      hacker_news.ds_date: 2 days
    sorts: [hacker_news.ds_date desc, hacker_news.content_sentiment]
    limit: '500'
    column_limit: '50'
    query_timezone: America/Los_Angeles
    show_value_labels: true
    font_size: 12
    show_view_names: true
    value_labels: legend
    label_type: labPer
    stacking: ''
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    colors: ['#d5e2e6', '#c1340c', '#61a5a4', '#2c8912']

  - name: prediction_accuracy
    title: How accurate are headlines at predicting content?
    type: looker_line
    model: hacker_news_sentiment_tracker
    explore: pred_accuracy
    dimensions: [pred_accuracy.hacker_news_ds_date, pred_accuracy.hacker_news_title_sentiment]
    pivots: [pred_accuracy.hacker_news_title_sentiment]
    measures: [pred_accuracy.pred_accuracy]
    dynamic_fields:
    - table_calculation: 7d_avg
      label: 7d_avg
      expression: mean(offset_list(${pred_accuracy.pred_accuracy}, -6, 7))
    sorts: [pred_accuracy.hacker_news_ds_date desc, pred_accuracy.hacker_news_title_sentiment]
    limit: '500'
    column_limit: '50'
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    series_types: {}
    x_axis_label: Date
    hidden_fields: [pred_accuracy.pred_accuracy]
    reference_lines: []
    series_labels:
      negative - 7d_avg: negative headline
      neutral - 7d_avg: neutral headline
      positive - 7d_avg: positive headline
    colors: 'palette: Looker Classic'
    series_colors:
      negative - 7d_avg: '#c1340c'
      positive - 7d_avg: '#2c8912'
      neutral - 7d_avg: '#61a5a4'
      N/A - 7d_avg: '#d5e2e6'
    y_axis_labels: [content prediction accuracy]


  - name: headline_sentiment_trend
    title: Headline Sentiment Trend
    type: looker_line
    model: hacker_news_sentiment_tracker
    explore: hacker_news
    dimensions: [hacker_news.ds_date, hacker_news.title_sentiment]
    pivots: [hacker_news.title_sentiment]
    measures: [hacker_news.count]
    dynamic_fields:
    - table_calculation: 7d_avg
      label: 7d_avg
      expression: mean(offset_list(${hacker_news.count}, -6, 7))
    sorts: [hacker_news.ds_date, hacker_news.title_sentiment]
    limit: '500'
    column_limit: '50'
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    show_row_numbers: true
    truncate_column_names: false
    table_theme: editable
    series_types: {}
    hidden_series: [positive - Hacker News Count, neutral - Hacker News Count, negative - Hacker News Count]
    hidden_fields: [hacker_news.count]
    x_axis_label: Date
    series_labels:
      negative - 7d_avg: negative headline
      neutral - 7d_avg: neutral headline
      positive - 7d_avg: positive headline
    series_colors:
      N/A - 7d_avg: '#d5e2e6'
      negative - 7d_avg: '#c1340c'
      neutral - 7d_avg: '#61a5a4'
      positive - 7d_avg: '#2c8912'
    y_axis_labels: [Article count]

  - name: content_sentiment_trend
    title: Content Sentiment Trend
    type: looker_line
    model: hacker_news_sentiment_tracker
    explore: hacker_news
    dimensions: [hacker_news.ds_date, hacker_news.content_sentiment]
    pivots: [hacker_news.content_sentiment]
    measures: [hacker_news.count]
    dynamic_fields:
    - table_calculation: 7d_avg
      label: 7d_avg
      expression: mean(offset_list(${hacker_news.count}, -6, 7))
    sorts: [hacker_news.content_sentiment desc, hacker_news.ds_date]
    limit: '500'
    column_limit: '50'
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    show_row_numbers: true
    truncate_column_names: false
    table_theme: editable
    series_types: {}
    hidden_series: [positive - Hacker News Count, neutral - Hacker News Count, negative - Hacker News Count]
    hidden_fields: [hacker_news.count]
    x_axis_label: Date
    series_colors:
      positive - 7d_avg: '#2c8912'
      N/A - 7d_avg: '#d5e2e6'
      negative - 7d_avg: '#c1340c'
      neutral - 7d_avg: '#61a5a4'
    series_labels:
      positive - 7d_avg: positive content
      neutral - 7d_avg: neutral content
      negative - 7d_avg: negative content
    y_axis_labels: [Article count]

