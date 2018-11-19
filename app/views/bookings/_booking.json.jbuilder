json.extract! booking, :id, :title, :comment, :start, :end, :status, :user_id, :author_id, :customer_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
