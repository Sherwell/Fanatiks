class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :logo
      t.boolean :active
      t.date :start_date
      t.date :end_date
      t.references :sport, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
