json.extract! billing, :id, :code, :payment_method, :amount, :amount, :currency, :customer_id, :created_at, :updated_at
json.url billing_url(billing, format: :json)
