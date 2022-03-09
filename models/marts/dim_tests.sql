version: 2

models:
  - name: stg_customers
    columns: 
      - name: id
        tests:
          - unique
          - not_null
  - name: stg_orders
    columns: 
      - name: id
        tests:
          - unique
          - not_null
      - name: status
        tests:
          - accepted_values:
              values:
                - completed
                - shipped
                - returned
                - placed
                - return_pending
      - name: id
        tests:
          - relationships:
              to: ref('stg_customers')
              field: id
          