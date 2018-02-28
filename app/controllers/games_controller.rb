class GamesController < ApplicationController
  def create
  	date = Date.new params["games"]["date_played(1i)"].to_i, params["games"]["date_played(2i)"].to_i, params["games"]["date_played(3i)"].to_i
    game = Game.new(:user_id => current_user.id, :score => params["games"]["score"], :opponent_score => params["games"]["opponent_score"], :opponent_user_id => User.find_by_email(params["games"]["opponent_user_id"]).id, :date_played => date)
  	if game.save!
      game.update_leader_board
    end
  	redirect_to leader_boards_path
  end

  def history
  end

  def log
  end
end
