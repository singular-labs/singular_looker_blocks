- dashboard: source_drilldown
  title: Source Drilldown
  layout: newspaper
  elements:
  - title: "# Campaigns"
    name: "# Campaigns"
    model: singular_block
    explore: marketing_data
    type: single_value
    fields: [marketing_data.total_campaigns]
    limit: 500
    listen:
      Time Range: marketing_data.date_date
      Channel: marketing_data.source
      Campaign: marketing_data.adn_campaign_name
    row: 0
    col: 4
    width: 4
    height: 3
  - title: CPC
    name: CPC
    model: singular_block
    explore: marketing_data
    type: single_value
    fields: [marketing_data.cpc]
    filters: {}
    limit: 500
    dynamic_fields: [{table_calculation: cost_per_conversion, label: Cost Per Conversion,
        expression: "${marketing_data.cost}/${marketing_data.conversions}", value_format: !!null '',
        value_format_name: usd, is_disabled: true, _kind_hint: measure, _type_hint: number},
      {table_calculation: cpm, label: CPM, expression: "${marketing_data.cost} / ${marketing_data.impressions}\
          \ * 1000", value_format: !!null '', value_format_name: usd, is_disabled: true,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: ''
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: []
    listen:
      Time Range: marketing_data.date_date
      Channel: marketing_data.source
      Campaign: marketing_data.adn_campaign_name
    row: 0
    col: 0
    width: 4
    height: 3
  - title: Cost Per Conversion
    name: Cost Per Conversion
    model: singular_block
    explore: marketing_data
    type: single_value
    fields: [marketing_data.cpe]
    filters: {}
    limit: 500
    dynamic_fields: [{table_calculation: cost_per_conversion, label: Cost Per Conversion,
        expression: "${marketing_data.cost}/${marketing_data.conversions}", value_format: !!null '',
        value_format_name: usd, _kind_hint: measure, _type_hint: number, is_disabled: true}]
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: ''
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: []
    listen:
      Time Range: marketing_data.date_date
      Channel: marketing_data.source
      Campaign: marketing_data.adn_campaign_name
    row: 0
    col: 8
    width: 5
    height: 3
  - title: CPM
    name: CPM
    model: singular_block
    explore: marketing_data
    type: single_value
    fields: [marketing_data.impressions, marketing_data.cost]
    filters: {}
    limit: 500
    dynamic_fields: [{table_calculation: cost_per_conversion, label: Cost Per Conversion,
        expression: "${marketing_data.cost}/${marketing_data.conversions}", value_format: !!null '',
        value_format_name: usd, is_disabled: true, _kind_hint: measure, _type_hint: number},
      {table_calculation: cpm, label: CPM, expression: "${marketing_data.cost} / ${marketing_data.impressions}\
          \ * 1000", value_format: !!null '', value_format_name: usd, is_disabled: false,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: ''
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [marketing_data.cost, marketing_data.impressions]
    listen:
      Time Range: marketing_data.date_date
      Channel: marketing_data.source
      Campaign: marketing_data.adn_campaign_name
    row: 3
    col: 0
    width: 4
    height: 3
  - title: Metrics Trends
    name: Metrics Trends
    model: singular_block
    explore: marketing_data
    type: looker_line
    fields: [marketing_data.date_date, marketing_data.cpc, marketing_data.ctr, marketing_data.cvr,
      marketing_data.cpm, marketing_data.cpe]
    filters:
      marketing_data.cost: ">100"
    sorts: [marketing_data.date_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: marketing_data.cpc,
            id: marketing_data.cpc, name: CPC}], showLabels: false, showValues: false,
        unpinAxis: true, tickDensity: default, type: linear}, {label: '', orientation: left,
        series: [{axisId: marketing_data.cvr, id: marketing_data.cvr, name: CVR}],
        showLabels: false, showValues: false, unpinAxis: true, tickDensity: default,
        type: linear}, {label: '', orientation: left, series: [{axisId: marketing_data.cpm,
            id: marketing_data.cpm, name: CPM}], showLabels: false, showValues: false,
        unpinAxis: true, tickDensity: default, type: linear}, {label: '', orientation: left,
        series: [{axisId: marketing_data.cpe, id: marketing_data.cpe, name: Cost Per
              Conversion}], showLabels: false, showValues: false, unpinAxis: true,
        tickDensity: default, type: linear}, {label: !!null '', orientation: left,
        series: [{axisId: marketing_data.ctr, id: marketing_data.ctr, name: CTR}],
        showLabels: false, showValues: false, unpinAxis: true, tickDensity: default,
        type: linear}]
    hide_legend: false
    series_types: {}
    trend_lines: []
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      marketing_data.impressions: 100
    series_cell_visualizations:
      marketing_data.impressions:
        is_active: false
      marketing_data.clicks:
        is_active: false
      marketing_data.conversions:
        is_active: true
      marketing_data.cost:
        is_active: true
      marketing_data.cpc:
        is_active: true
      marketing_data.cpm:
        is_active: true
      marketing_data.cvr:
        is_active: true
      marketing_data.ctr:
        is_active: true
    defaults_version: 1
    listen:
      Time Range: marketing_data.date_date
      Channel: marketing_data.source
      Campaign: marketing_data.adn_campaign_name
    row: 0
    col: 13
    width: 11
    height: 6
  - title: CTR
    name: CTR
    model: singular_block
    explore: marketing_data
    type: single_value
    fields: [marketing_data.impressions, marketing_data.clicks]
    filters: {}
    limit: 500
    dynamic_fields: [{table_calculation: cost_per_conversion, label: Cost Per Conversion,
        expression: "${marketing_data.cost}/${marketing_data.conversions}", value_format: !!null '',
        value_format_name: usd, is_disabled: true, _kind_hint: dimension, _type_hint: number},
      {table_calculation: cpm, label: CPM, expression: "${marketing_data.cost} / ${marketing_data.impressions}\
          \ * 1000", value_format: !!null '', value_format_name: usd, is_disabled: true,
        _kind_hint: measure, _type_hint: number}, {table_calculation: ctr, label: CTR,
        expression: "${marketing_data.clicks} / ${marketing_data.impressions}", value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: ''
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [marketing_data.impressions, marketing_data.clicks]
    listen:
      Time Range: marketing_data.date_date
      Channel: marketing_data.source
      Campaign: marketing_data.adn_campaign_name
    row: 3
    col: 4
    width: 4
    height: 3
  - title: Spend
    name: Spend
    model: singular_block
    explore: marketing_data
    type: single_value
    fields: [marketing_data.cost]
    filters: {}
    sorts: [marketing_data.cost desc]
    limit: 500
    dynamic_fields: [{table_calculation: cost_per_conversion, label: Cost Per Conversion,
        expression: "${marketing_data.cost}/${marketing_data.conversions}", value_format: !!null '',
        value_format_name: usd, _kind_hint: measure, _type_hint: number, is_disabled: true}]
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: ''
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Time Range: marketing_data.date_date
      Channel: marketing_data.source
      Campaign: marketing_data.adn_campaign_name
    row: 3
    col: 8
    width: 5
    height: 3
  - title: Keyword Breakdown
    name: Keyword Breakdown
    model: singular_block
    explore: marketing_data
    type: looker_grid
    fields: [marketing_data.keyword, marketing_data.impressions, marketing_data.clicks,
      marketing_data.cvr, marketing_data.conversions, marketing_data.cpc, marketing_data.cost]
    filters:
      marketing_data.keyword: "-EMPTY"
    sorts: [marketing_data.impressions desc]
    limit: 500
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_column_widths:
      marketing_data.clicks: 91
      marketing_data.impressions: 92
    series_cell_visualizations:
      marketing_data.impressions:
        is_active: false
      marketing_data.clicks:
        is_active: false
      marketing_data.conversions:
        is_active: true
      marketing_data.cost:
        is_active: true
      marketing_data.cvr:
        is_active: true
      marketing_data.cpc:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Time Range: marketing_data.date_date
      Channel: marketing_data.source
      Campaign: marketing_data.adn_campaign_name
    row: 12
    col: 0
    width: 24
    height: 6
  - title: Campaign Level
    name: Campaign Level
    model: singular_block
    explore: marketing_data
    type: looker_grid
    fields: [marketing_data.impressions, marketing_data.ctr, marketing_data.clicks,
      marketing_data.cvr, marketing_data.conversions, marketing_data.cost, marketing_data.cpc,
      marketing_data.cpm, marketing_data.adn_campaign_name]
    filters: {}
    sorts: [marketing_data.cost desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      marketing_data.impressions: 100
    series_cell_visualizations:
      marketing_data.impressions:
        is_active: false
      marketing_data.clicks:
        is_active: false
      marketing_data.conversions:
        is_active: true
      marketing_data.cost:
        is_active: true
      marketing_data.cpc:
        is_active: true
        palette:
          palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      marketing_data.cpm:
        is_active: true
      marketing_data.cvr:
        is_active: true
      marketing_data.ctr:
        is_active: true
    series_types: {}
    defaults_version: 1
    listen:
      Time Range: marketing_data.date_date
      Channel: marketing_data.source
      Campaign: marketing_data.adn_campaign_name
    row: 6
    col: 0
    width: 24
    height: 6
  filters:
  - name: Time Range
    title: Time Range
    type: field_filter
    default_value: this year
    allow_multiple_values: true
    required: false
    model: singular_block
    explore: marketing_data
    listens_to_filters: []
    field: marketing_data.date_date
  - name: Channel
    title: Channel
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: singular_block
    explore: marketing_data
    listens_to_filters: []
    field: marketing_data.source
  - name: Campaign
    title: Campaign
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: singular_block
    explore: marketing_data
    listens_to_filters: []
    field: marketing_data.adn_campaign_name
