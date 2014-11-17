class CreateProducts < ActiveRecord::Migration

  # TODO add new [FEATURE]
   def self.table_exists?(name)
     ActiveRecord::Base.connection.tables.include?(name)
   end

  def change
    drop_table :products if self.table_exists?("products")

    create_table :products do |t|
      t.string :title
      t.decimal :price, precision: 8, scale: 2
      t.text :body
      t.boolean :some
      t.integer :scrool

      t.timestamps null: false
    end
  end
end


