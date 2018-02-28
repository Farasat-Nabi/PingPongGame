class HomeController < ApplicationController
  def index
  end

  def history
  	@games = Game.where(:user_id => current_user.id).order('date_played DESC')
  end

  def log
  end
end
