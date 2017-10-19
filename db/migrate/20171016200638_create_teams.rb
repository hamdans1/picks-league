class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :league, index: true, foreign_key: true
      t.string :city
      t.string :name
      t.string :coach
      t.boolean :over
      t.decimal :predictive
      t.integer :actual

      t.timestamps null: false
    end
  end
end
