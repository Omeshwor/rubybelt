Rails.application.routes.draw do
  root 'users#new'
  resources :users
  resources :songs
    # resources :secrets, only: [:create, :destroy, :index]
    # resources :likes, only: [:create, :destroy]
  get	  '/sessions/new',	    to: 'sessions#new'
  post	'/sessions/new',	    to: 'sessions#create'
  delete'/sessions/:id',	    to: 'sessions#destroy'

  post  '/playlists',         to: 'playlists#create'
  get   '/playlists/:id',      to: 'playlists#show'

end
