class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :surname
      t.string :given_name
      t.string :position
      t.integer :at_bats
      t.integer :caught_stealing
      t.integer :doubles
      t.integer :errors
      t.integer :games
      t.integer :games_started
      t.integer :hit_by_pitch
      t.integer :hits
      t.integer :home_runs
      t.integer :pb
      t.integer :rbi
      t.integer :runs
      t.integer :sacrifice_flies
      t.integer :sacrifice_hits
      t.integer :steals
      t.integer :struck_out
      t.integer :triples
      t.integer :walks
      t.float   :ops
      t.float   :batting_average
      t.integer :stolen_bases

      t.timestamps
    end

    add_index :players, :runs
    add_index :players, :rbi
    add_index :players, :home_runs
    add_index :players, :ops
    add_index :players, :batting_average
    add_index :players, :stolen_bases
  end
end
