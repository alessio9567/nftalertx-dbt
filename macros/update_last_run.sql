{% macro update_last_run(slug, chain) %}
    update {{ source('raw', 'pipeline_last_run') }}
    set last_run_ts = unix_timestamp()
    where slug = '{{ slug }}'
      and chain = '{{ chain }}';
{% endmacro %}
