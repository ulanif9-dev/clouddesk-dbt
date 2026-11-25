version: 2

models:
  - name: stg_subscriptions
    columns:
      - name: subscription_id
        data_tests:
          - unique
          - not_null
      - name: subscription_status
        data_tests:
          - accepted_values:
              values: ['active', 'churned']

  - name: stg_tickets
    columns:
      - name: priority
        data_tests:
          - accepted_values:
              values: ['urgent', 'high', 'medium', 'low']
