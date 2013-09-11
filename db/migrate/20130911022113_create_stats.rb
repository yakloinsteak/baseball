class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :player_id
      t.integer :year
      t.integer :at_bats
      t.integer :caught_stealing
      t.integer :doubles
      t.integer :batting_errors
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

    add_index :stats, :player_id
    add_index :stats, :year
    add_index :stats, :runs
    add_index :stats, :rbi
    add_index :stats, :home_runs
    add_index :stats, :ops
    add_index :stats, :batting_average
    add_index :stats, :stolen_bases
  end
end
