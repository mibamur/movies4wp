class AddAdminToLogin < ActiveRecord::Migration
  def change
    add_column :logins, :admin, :boolean
  end
end
