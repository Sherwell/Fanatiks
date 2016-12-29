class CreateGroupTeams < ActiveRecord::Migration
  def change
    create_table :group_teams do |t|
      t.integer :pj
      t.integer :pg
      t.integer :pe
      t.integer :pp
      t.integer :gf
      t.integer :gc
      t.integer :dif
      t.integer :pts
      t.references :group, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
