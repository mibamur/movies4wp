class CreateCharts < ActiveRecord::Migration

  # TODO add new [FEATURE]
   def self.table_exists?(name)
     ActiveRecord::Base.connection.tables.include?(name)
   end

  def change
    drop_table :charts if self.table_exists?("charts")

    create_table :charts do |t|
      t.string :name
    end
  end
end


