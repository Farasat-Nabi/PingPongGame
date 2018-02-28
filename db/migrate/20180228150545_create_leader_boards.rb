class CreateLeaderBoards < ActiveRecord::Migration
  def change
    create_table :leader_boards do |t|
      t.integer :rank
      t.integer :user_id
      t.string :name
      t.integer :score
      t.integer :games_played

      t.timestamps null: false
    end
  end
end
