class CreatePlayerTeams < ActiveRecord::Migration
  def change
    create_table :player_teams do |t|
      t.integer :player_id
      t.integer :team_id

      t.timestamps
    end

    add_index :player_teams, [:player_id, :team_id], :unique => true
  end
end
