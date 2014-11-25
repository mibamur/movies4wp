# rvm path

json.array!(@kinodoms) do |kinodom|
  json.extract! kinodom, :name, :id, :name, :desc, :remote_server, :local_server, :login, :pass, :db
  json.url kinodom_url(kinodom, format: :json)
end
