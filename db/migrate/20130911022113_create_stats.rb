class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :player_id
      t.integer :year
      t.float   :batting_average
      t.float   :ops
      t.integer :at_bats
      t.integer :balk
      t.integer :batting_errors
      t.integer :caught_stealing
      t.integer :complete_games
      t.integer :doubles
      t.integer :earned_runs
      t.integer :era
      t.integer :games
      t.integer :games_started
      t.integer :hit_batter
      t.integer :hit_by_pitch
      t.integer :hits
      t.integer :home_runs
      t.integer :innings
      t.integer :losses
      t.integer :pb
      t.integer :rbi
      t.integer :runs
      t.integer :sacrifice_flies
      t.integer :sacrifice_hits
      t.integer :saves
      t.integer :shut_outs
      t.integer :steals
      t.integer :stolen_bases
      t.integer :struck_out
      t.integer :struck_out_batter
      t.integer :throws
      t.integer :triples
      t.integer :walked_batter
      t.integer :walks
      t.integer :wild_pitches
      t.integer :wins

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
