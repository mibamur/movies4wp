# rvm path

json.array!(@kinofilm_datetimes) do |kinofilm_datetime|
  json.extract! kinofilm_datetime, :name, :id, :seans_date, :seans_time, :kinozal_id, :kinofilm_id
  json.url kinofilm_datetime_url(kinofilm_datetime, format: :json)
end
