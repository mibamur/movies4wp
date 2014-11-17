class CreateTheaters < ActiveRecord::Migration

  # TODO add new [FEATURE]
   def self.table_exists?(name)
     ActiveRecord::Base.connection.tables.include?(name)
   end

  def change
    drop_table :theaters if self.table_exists?("theaters")

    create_table :theaters do |t|
      t.string :post_title
      t.string :post_name
      t.text :post_content
      t.string :post_status
      t.boolean :sticky
      t.text :custom_fields
      t.integer :movies_length
      t.string :event_imdb_url
      t.string :poster
      t.string :poster_big
      t.integer :kinopoisk_id
      t.decimal :main_price, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end


