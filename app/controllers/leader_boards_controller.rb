class LeaderBoardsController < ApplicationController

	def index
		@leader_board = LeaderBoard.order('rank')
	end
end
