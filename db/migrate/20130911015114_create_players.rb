class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :surname
      t.string :given_name
      t.timestamps
    end

    add_index :players, :surname
    add_index :players, :given_name
  end
end
