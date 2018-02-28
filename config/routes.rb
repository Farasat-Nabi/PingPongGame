Rails.application.routes.draw do
  devise_for :users
  root to: "leader_boards#index"
  get '/history', to: 'home#history'
  get '/log',     to: 'home#log'
  # resources :games do member
	# resources :games, only: [] do
 #    member do
 #      post 'add'
 #      # patch 'disable'
 #    end
 #  end

 resources :games, only: [:index, :new, :create, :edit, :update], shallow: true do
		# member do
  #   	post 'new'
  #   	 # patch 'disable'
  #  	end
	end

  resources :leader_boards, only: [:index]
end
