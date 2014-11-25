class CreateKinodoms < ActiveRecord::Migration

  # TODO add new [FEATURE]
   def self.table_exists?(name)
     ActiveRecord::Base.connection.tables.include?(name)
   end

  def change
    drop_table :kinodoms if self.table_exists?("kinodoms")

    create_table :kinodoms do |t|
      t.string :name
      t.text :desc
      t.string :remote_server
      t.string :local_server
      t.string :login
      t.string :pass
      t.string :db

      t.timestamps null: false
    end
  end
end


