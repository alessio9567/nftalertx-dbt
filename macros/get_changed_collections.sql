{% macro get_changed_collections() %}

    with last_run as (
        select slug, chain, last_run_ts
        from {{ source('raw', 'pipeline_last_run') }}
    ),

    changed as (
        select distinct h.slug, h.chain
        from {{ source('raw', 'historical_nft_data') }} h
        join last_run lr
          on h.slug = lr.slug
         and h.chain = lr.chain
         and h.latest_floor_timestamp > lr.last_run_ts
    )

    select * from changed

{% endmacro %}
