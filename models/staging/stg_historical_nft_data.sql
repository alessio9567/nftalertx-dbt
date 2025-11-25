{{ config(materialized='view') }}

select
    slug,
    chain,
    latest_floor_ts,
    floor_native,
    floor_usd,
    chain_currency_symbol
from {{ source('raw','historical_nft_data') }}
