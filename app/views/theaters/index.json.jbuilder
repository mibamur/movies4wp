# rvm path

json.array!(@theaters) do |theater|
  json.extract! theater, :name, :id, :post_title, :post_name, :post_content, :post_status, :sticky, :custom_fields, :movies_length, :event_imdb_url, :poster, :poster_big, :kinopoisk_id, :main_price
  json.url theater_url(theater, format: :json)
end
