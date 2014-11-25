class CreateKinofilmDatetimes < ActiveRecord::Migration

  # TODO add new [FEATURE]
   def self.table_exists?(name)
     ActiveRecord::Base.connection.tables.include?(name)
   end

  def change
    drop_table :kinofilm_datetimes if self.table_exists?("kinofilm_datetimes")

    create_table :kinofilm_datetimes do |t|
      t.string :seans_date
      t.string :seans_time
      t.belongs_to :kinozal, index: true
      t.belongs_to :kinofilm, index: true

      t.timestamps null: false
    end
  end
end


