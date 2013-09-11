class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :city
      t.integer :division_id
      t.timestamps
    end

    add_index :teams, :name
    add_index :teams, :city
    add_index :teams, :division_id
  end
end
