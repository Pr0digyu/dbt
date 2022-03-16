with teste_airbyte_prefect as (
select t.*,current_timestamp as prefect_load from airbyte_database.airbyte_schema.teste_airbyte t

)

select * from teste_airbyte_prefect