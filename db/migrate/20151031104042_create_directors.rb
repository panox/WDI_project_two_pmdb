class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.string :name
      t.text :description
      t.string :country
      t.text :picture

      t.timestamps null: false
    end
  end
end
