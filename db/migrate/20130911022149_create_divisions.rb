class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.integer :league_id
      t.string :name
      t.timestamps
    end

    add_index :divisions, :name
    add_index :divisions, [:league_id, :name], unique: true
  end
end
