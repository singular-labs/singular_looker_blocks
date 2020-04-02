- dashboard: marketing_overview
  title: Marketing Overview
  layout: newspaper
  elements:
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
    row: 0
    col: 12
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
    row: 3
    col: 12
    width: 4
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
    row: 3
    col: 4
    width: 4
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
      Channel: marketing_data.source
    row: 3
    col: 8
    width: 4
    height: 3
  - title: Channel Level
    name: Channel Level
    model: singular_block
    explore: marketing_data
    type: looker_grid
    fields: [marketing_data.source, marketing_data.impressions, marketing_data.ctr,
      marketing_data.clicks, marketing_data.cvr, marketing_data.conversions, marketing_data.cost,
      marketing_data.cpc, marketing_data.cpm]
    filters: {}
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
    listen:
      Time Range: marketing_data.date_date
      Channel: marketing_data.source
    row: 13
    col: 0
    width: 12
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
      Channel: marketing_data.source
    row: 0
    col: 8
    width: 4
    height: 3
  - title: "# Channels"
    name: "# Channels"
    model: singular_block
    explore: marketing_data
    type: single_value
    fields: [marketing_data.total_channels]
    limit: 500
    listen:
      Time Range: marketing_data.date_date
      Channel: marketing_data.source
    row: 0
    col: 0
    width: 4
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
      Channel: marketing_data.source
    row: 0
    col: 4
    width: 4
    height: 3
  - title: Proportion of Cost by Channel
    name: Proportion of Cost by Channel
    model: singular_block
    explore: marketing_data
    type: looker_pie
    fields: [marketing_data.source, marketing_data.cost]
    filters: {}
    sorts: [marketing_data.cost desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 30
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    listen:
      Time Range: marketing_data.date_date
      Channel: marketing_data.source
    row: 0
    col: 16
    width: 8
    height: 6
  - title: Metric Comparison
    name: Metric Comparison
    model: singular_block
    explore: marketing_data
    type: looker_line
    fields: [marketing_data.date_date, marketing_data.cvr, marketing_data.ctr, marketing_data.cpm,
      marketing_data.cpc, marketing_data.cpe]
    fill_fields: [marketing_data.date_date]
    filters: {}
    sorts: [marketing_data.date_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
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
    y_axes: [{label: '', orientation: left, series: [{axisId: marketing_data.cvr,
            id: marketing_data.cvr, name: Marketing Data CVR}], showLabels: false,
        showValues: false, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: left, series: [{axisId: marketing_data.cpe,
            id: marketing_data.cpe, name: Marketing Data Cost Per Conversion}], showLabels: false,
        showValues: false, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: left, series: [{axisId: marketing_data.cpc,
            id: marketing_data.cpc, name: Marketing Data CPC}], showLabels: false,
        showValues: false, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: left, series: [{axisId: marketing_data.cpm,
            id: marketing_data.cpm, name: Marketing Data CPM}], showLabels: false,
        showValues: false, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: left, series: [{axisId: marketing_data.ctr,
            id: marketing_data.ctr, name: Marketing Data CTR}], showLabels: false,
        showValues: false, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    value_labels: legend
    label_type: labPer
    inner_radius: 30
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Time Range: marketing_data.date_date
      Channel: marketing_data.source
    row: 6
    col: 0
    width: 12
    height: 7
  - title: CTR by Device and Channel
    name: CTR by Device and Channel
    model: singular_block
    explore: marketing_data
    type: looker_donut_multiples
    fields: [marketing_data.platform, marketing_data.ctr, marketing_data.source]
    pivots: [marketing_data.platform]
    filters: {}
    sorts: [marketing_data.ctr desc 0, marketing_data.source, marketing_data.platform]
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: 12
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: marketing_data.cvr,
            id: marketing_data.cvr, name: CVR}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: left, series: [{axisId: marketing_data.cpe,
            id: marketing_data.cpe, name: Cost Per Conversion}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: left, series: [{axisId: marketing_data.cpc,
            id: marketing_data.cpc, name: CPC}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: left, series: [{axisId: marketing_data.cpm,
            id: marketing_data.cpm, name: CPM}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: left, series: [{axisId: marketing_data.ctr,
            id: marketing_data.ctr, name: CTR}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle_outline
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    inner_radius: 30
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Time Range: marketing_data.date_date
      Channel: marketing_data.source
    row: 6
    col: 12
    width: 12
    height: 7
  - title: Country Breakdown
    name: Country Breakdown
    model: singular_block
    explore: marketing_data
    type: looker_grid
    fields: [marketing_data.impressions, marketing_data.clicks, marketing_data.cvr,
      marketing_data.conversions, marketing_data.cpc, marketing_data.cost, marketing_data.country_field]
    sorts: [marketing_data.impressions desc]
    limit: 500
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
    show_totals: true
    show_row_totals: true
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
    series_types: {}
    defaults_version: 1
    listen:
      Time Range: marketing_data.date_date
      Channel: marketing_data.source
    row: 13
    col: 12
    width: 12
    height: 6
  filters:
  - name: Time Range
    title: Time Range
    type: field_filter
    default_value: 2020/03/14 to 2020/03/29
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
