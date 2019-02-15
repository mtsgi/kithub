json.extract! app, :id, :name, :author, :desc, :genre, :url, :data, :created_at, :updated_at
json.url app_url(app, format: :json)
