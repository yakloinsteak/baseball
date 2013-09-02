class CreatePigs < ActiveRecord::Migration
  def change
    create_table :pigs do |t|
      t.string :name

      t.timestamps
    end
  end
end
