json.extract! booking, :id, :formula, :comment, :date, :start_time, :end_time, :status, :user_id, :author_id, :customer_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
