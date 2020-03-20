- dashboard: trends
  title: Trends
  layout: newspaper
  elements:
  - title: Conversions By Geo
    name: Conversions By Geo
    model: singular_block
    explore: marketing_data
    type: looker_map
    fields: [marketing_data.country_field, marketing_data.conversions]
    limit: 500
    series_types: {}
    listen:
      Time Range: marketing_data.date_date
    row: 22
    col: 0
    width: 11
    height: 7
  - title: "# Channels"
    name: "# Channels"
    model: singular_block
    explore: marketing_data
    type: single_value
    fields: [marketing_data.total_channels]
    limit: 500
    listen:
      Time Range: marketing_data.date_date
    row: 0
    col: 0
    width: 4
    height: 6
  - title: "# Campaigns"
    name: "# Campaigns"
    model: singular_block
    explore: marketing_data
    type: single_value
    fields: [marketing_data.total_campaigns]
    limit: 500
    listen:
      Time Range: marketing_data.date_date
    row: 0
    col: 9
    width: 6
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
    row: 3
    col: 4
    width: 5
    height: 3
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
    row: 3
    col: 9
    width: 6
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
    row: 16
    col: 0
    width: 24
    height: 6
  - title: Channel Level
    name: Channel Level
    model: singular_block
    explore: marketing_data
    type: looker_grid
    fields: [marketing_data.source, marketing_data.impressions, marketing_data.ctr,
      marketing_data.clicks, marketing_data.cvr, marketing_data.conversions, marketing_data.cost,
      marketing_data.cpc, marketing_data.cpm]
    filters:
      marketing_data.date_date: 90 days
    sorts: [marketing_data.cvr desc]
    limit: 500
    column_limit: 50
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
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
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen: {}
    row: 10
    col: 0
    width: 24
    height: 6
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
    row: 0
    col: 4
    width: 5
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
    row: 5
    col: 15
    width: 9
    height: 5
  - title: Spend
    name: Spend
    model: singular_block
    explore: marketing_data
    type: single_value
    fields: [marketing_data.cost, marketing_data.date_week]
    fill_fields: [marketing_data.date_week]
    filters: {}
    sorts: [marketing_data.date_week desc]
    limit: 500
    dynamic_fields: [{table_calculation: cost_per_conversion, label: Cost Per Conversion,
        expression: "${marketing_data.cost}/${marketing_data.conversions}", value_format: !!null '',
        value_format_name: usd, is_disabled: true, _kind_hint: measure, _type_hint: number},
      {table_calculation: spend_change, label: Spend Change, expression: "${marketing_data.cost}\
          \ / offset(${marketing_data.cost}, 1) - 1", value_format: !!null '', value_format_name: percent_3,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Last Week spend
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Weekly Change
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [marketing_data.date_week]
    listen:
      Time Range: marketing_data.date_date
      Channel: marketing_data.source
    row: 0
    col: 15
    width: 9
    height: 5
  filters:
  - name: Time Range
    title: Time Range
    type: field_filter
    default_value: 7 days
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
