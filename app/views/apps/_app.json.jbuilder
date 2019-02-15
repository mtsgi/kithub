json.extract! app, :id, :name, :appid, :author, :desc, :genre, :url, :data, :created_at, :updated_at
json.url app_url(app, format: :json)
