json.extract! service, :id, :name, :price, :status, :author_id, :created_at, :updated_at
json.url service_url(service, format: :json)
