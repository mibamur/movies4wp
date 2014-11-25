# rvm path

json.array!(@kinozals) do |kinozal|
  json.extract! kinozal, :name, :id, :name, :kinodom_id
  json.url kinozal_url(kinozal, format: :json)
end
