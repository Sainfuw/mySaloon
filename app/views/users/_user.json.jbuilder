json.extract! user, :id, :name, :lastname, :surname, :email, :phone, :status, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
