class Game < ActiveRecord::Base
	belongs_to :users

	validates_presence_of :score, :opponent_score

	def update_leader_board
		current_player = User.find(self.user_id)
		opponent = User.find(self.opponent_user_id)
		score = self.score
		opponent_score = self.opponent_score
		diff = score - opponent_score
		player = LeaderBoard.where(:user_id => self.user_id).last
		opponent_player = LeaderBoard.where(:user_id => self.opponent_user_id).last
		if diff < 2 && diff > -2
			diff = 0
		end
		if player.present?
			player_rank =  player.rank
		else
			player_rank = 0
		end
		if opponent_player.present?
			opponent_player_rank =  opponent_player.rank
		else
			opponent_player_rank = 0
		end
		total_diff = 0
		if diff != 0
			rank_diff = player_rank - opponent_player_rank
			total_diff = rank_diff + diff
		end
		if player.present?
			player.update_attributes(:score => player.score + total_diff ,:games_played => player.games_played + 1)
		else
			LeaderBoard.create(:name => current_player.email,:user_id => current_player.id,:score => diff,:games_played => 1)			
		end
		if opponent_player.present?
			opponent_player.update_attributes(:score => opponent_player.score - total_diff ,:games_played => opponent_player.games_played + 1)
		else
			LeaderBoard.create(:name => opponent.email,:user_id => opponent.id,:score => diff * -1,:games_played => 1)				
		end	
		update_all_ranks
	end

	def update_all_ranks
		LeaderBoard.order('score DESC').each_with_index do |lb,index|
		lb.update_attributes(:rank => index + 1)		
		end
	end
end
