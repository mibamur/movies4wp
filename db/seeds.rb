['user', 'admin', 'root', 'dev'].each do |role|
  Role.find_or_create_by({name: role})
end

#   {email: "admin@mail.ru", password: "admin@mail.ru"},

Login.create!([
  {email: "user@mail.ru", password: "0000"}
])

lroot=Login.new
lroot.email="admin@mail.ru"
lroot.password="admin@mail.ru"
lroot.password_confirmation="admin@mail.ru"
lroot.add_role :root
lroot.save!


