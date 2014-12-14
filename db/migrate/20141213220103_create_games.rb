class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :black_id
      t.integer :white_id
      t.integer :turn_id
      t.string :result
      t.boolean :private
      t.boolean :ranked

      t.timestamps
    end
    
    add_index :games, :black_id
    add_index :games, :white_id
    add_index :games, :turn_id
  end
end
