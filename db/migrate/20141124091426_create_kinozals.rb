class CreateKinozals < ActiveRecord::Migration

  # TODO add new [FEATURE]
   def self.table_exists?(name)
     ActiveRecord::Base.connection.tables.include?(name)
   end

  def change
    drop_table :kinozals if self.table_exists?("kinozals")

    create_table :kinozals do |t|
      t.string :name
      t.belongs_to :kinodom, index: true

      t.timestamps null: false
    end
  end
end


