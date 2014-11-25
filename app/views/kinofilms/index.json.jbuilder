# rvm path

json.array!(@kinofilms) do |kinofilm|
  json.extract! kinofilm, :name, :id, :post_title, :post_name, :post_content, :post_status, :sticky, :custom_fields, :movies_length, :event_imdb_url, :poster, :poster_big, :trailer, :kinopoisk_id, :main_price
  json.url kinofilm_url(kinofilm, format: :json)
end
