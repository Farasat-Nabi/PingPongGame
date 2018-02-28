class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.integer :user_id
    	t.integer :opponent_user_id
    	t.integer :score
    	t.integer :opponent_score
    	t.datetime :date_played
      t.timestamps null: false
    end
  end
end
