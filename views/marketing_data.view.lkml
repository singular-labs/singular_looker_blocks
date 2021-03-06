view: marketing_data {
  sql_table_name: external_demo.marketing_data ;;

  dimension_group: date {
    type: time
    label: "" # we only have one date field
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
    drill_fields: [adn_account_name, adn_campaign_name, adn_sub_campaign_name, country_field]
    description: "The data source name, usually the name of the ad network."

    link: {
      label: "{{value}} Dashboard"
      url: "/dashboards/singular_block::source_drilldown?Channel={{ value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }

  dimension: adn_account_name {
    label: "Account"
    type: string
    sql: ${TABLE}.adn_account_name ;;
    description: "The account Name as reported by the ad network."
  }

  dimension: adn_campaign_name {
    label: "Campaign"
    type: string
    #drill_fields: [adn_sub_campaign_name, keyword, country_field]
    sql: ${TABLE}.adn_campaign_name ;;
    description: "The exact campaign name as reported by the ad network."
    link: {
      label: "{{value}} Dashboard"
      url: "/dashboards/singular_block::campaign_drilldown?Campaign={{ value | encode_uri }}&Channel="
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }

  dimension: adn_sub_adnetwork_name {
    type: string
    drill_fields: [adn_sub_campaign_name, country_field]
    label: "Sub Adnetwork"
    sql: ${TABLE}.adn_sub_adnetwork_name ;;
    description: "The sub-ad-network name where applicable. This field contains a subdivision of the ad network, as reported by the ad network itself."
  }


  dimension: adn_sub_campaign_name {
    type: string
    label: "Sub Campaign"
    sql: ${TABLE}.adn_sub_campaign_name ;;
    description: "The sub-campaign name where applicable. This field contains a sub-grouping of the campaign, e.g. what is called the \"ad group\" in some ad networks."
  }

  dimension: app {
    drill_fields: [source, adn_campaign_name, adn_sub_campaign_name, country_field]
    type: string
    sql: ${TABLE}.app ;;
    description: "Application name."
  }

  dimension: country_field {
    type: string
    label: "Country"
    sql: ${TABLE}.country_field ;;
    description: "The targeted country or countries, as reported by the ad network."
    map_layer_name: countries
  }

  dimension_group: etl_query_timestamp_utc {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    hidden: yes
    sql: ${TABLE}.etl_query_timestamp_utc ;;
  }

  dimension: keyword {
    label: "Keyword"
    type: string
    sql: ${TABLE}.keyword ;;
    description: "The targeted search keyword in search-based ads such as Google Ads or Apple Search Ads."
  }

  dimension: os {
    label: "OS"
    type: string
    drill_fields: [app, source, adn_campaign_name, adn_sub_campaign_name, country_field]
    sql: ${TABLE}.os ;;
    description: "The user's device operating system, such as \"iOS\" or \"Android\""
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
    description: "The user's device platform, such as \"iPhone\" or \"iPad\". If the source does not provide breakdown by iPhone/iPad, this field will be identical to os"
  }

# --------- Extra ---------------

  dimension: adn_account_id {
    group_label: "Extra"
    label: "Account ID"
    type: string
    sql: ${TABLE}.adn_account_id ;;
    description: "The account ID as reported by the ad network."
  }

  dimension: adn_campaign_id {
    group_label: "Extra"
    label: "Campaign ID"
    type: string
    sql: ${TABLE}.adn_campaign_id ;;
    description: "The campaign ID as reported by the ad network."
  }

  dimension: keyword_id {
    group_label: "Extra"
    type: string
    sql: ${TABLE}.keyword_id ;;
    description: "The internal ID given by the ad network to the targeted search keyword."
  }

  dimension: adn_sub_campaign_id {
    group_label: "Extra"
    type: string
    sql: ${TABLE}.adn_sub_campaign_id ;;
    description: "The sub-campaign ID where applicable. This field contains a sub-grouping of the campaign, e.g. what is called the \"ad group\" in some ad networks."
  }

  dimension: adn_original_currency {
    group_label: "Extra"
    type: string
    sql: ${TABLE}.adn_original_currency ;;
    description: "The campaign currency as reported by the ad network."
  }

  dimension: adn_campaign_url {
    group_label: "Extra"
    label: "Target URL"
    type: string
    sql: ${TABLE}.adn_campaign_url ;;
    description: "The reported URL for the campaign."
  }


# --------- Metrics -----------


  dimension: adn_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.adn_clicks ;;
    description: " Clicks reported by the ad networks."
  }

  dimension: adn_cost {
    type: number
    hidden: yes
    sql: ${TABLE}.adn_cost ;;
    description: "Cost reported by the ad network, in the user's default currency"
  }

  dimension: adn_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.adn_impressions ;;
    description: " Impressions reported by the ad network."
  }

  dimension: adn_installs {
    type: number
    hidden: yes
    sql: ${TABLE}.adn_installs ;;
    description: " Installs reported by the ad network."
  }

  dimension: adn_original_cost {
    type: number
    hidden: yes
    sql: ${TABLE}.adn_original_cost ;;
    description: "Original cost (presented in the original currency) reported by the ad network"
    required_fields: [adn_original_currency]
  }

  measure: impressions {
    type: sum
    description: "Impressions"
    sql:  ${adn_impressions} ;;
    drill_fields: [source, adn_campaign_name, adn_sub_campaign_name]
    value_format_name: decimal_0
  }

  measure: clicks {
    type: sum
    description: "Clicks"
    sql:  ${adn_clicks} ;;
    drill_fields: [source, adn_campaign_name, adn_sub_campaign_name]
    value_format_name: decimal_0
  }

  measure: ctr {
    type: number
    label: "CTR"
    description: "Click Rate (clicks / impressions)"
    sql:  ${clicks} / nullif(${impressions},0) ;;
    value_format_name: percent_2
  }

  measure: cvr {
    label: "CVR"
    type: number
    description: "Conversion Rate (conversions / clicks)"
    sql:  ${conversions} / nullif(${clicks}, 0) ;;
    value_format_name: percent_2
  }

  measure: cpc {
    label: "CPC"
    type: number
    description: "Cost Per Click (spend / clicks)"
    sql:  ${cost} / nullif(${clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cpm {
    label: "CPM"
    type: number
    description: "Cost Per Milli-Impressions (spend / impressions * 1000)"
    sql:  ${cost} / nullif(${impressions} * 100, 0) ;;
    value_format_name: usd
  }

  measure: cpe {
    label: "Cost Per Conversion"
    type: number
    description: " spend / conversions"
    sql:  ${cost} / nullif(${conversions}, 0) ;;
    value_format_name: usd
  }

  measure: conversions {
    type: sum
    description: "Conversions"
    sql:  ${adn_installs} ;;
    drill_fields: [source, adn_campaign_name, adn_sub_campaign_name]
    value_format_name: decimal_0
  }

  measure: cost {
    type: sum
    description: "Spend"
    sql:  ${adn_cost} ;;
    drill_fields: [source, adn_campaign_name, adn_sub_campaign_name]
    value_format_name: usd
  }

  measure: total_channels {
    type: count_distinct
    description: "Active Channels"
    sql:  ${source} ;;
    value_format_name: decimal_0
  }

  measure: total_campaigns {
    # note that in case reusing campaign names across channels you might want to concat ${source} or ${campaign_id}
    type: count_distinct
    description: "Active Campaigns"
    sql:  ${adn_campaign_name} ;;
    value_format_name: decimal_0
  }
}
