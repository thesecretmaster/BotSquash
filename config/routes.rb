Rails.application.routes.draw do
  devise_for :users
  root to: 'bots#index'

  resources :timelines
  resources :hashtags
  resources :networks

  scope 'bots' do
    root to: 'bots#index', as: :bots
    get 'new', to: 'bots#new', as: :new_bot
    post 'create', to: 'bots#create'
    get ':id/edit', to: 'bots#edit', as: :edit_bot
    post 'edit', to: 'bots#update', as: :update_bot
    get ':id', to: 'bots#show', as: :bot
    patch ':id', to: 'bots#update'
    put ':id', to: 'bots#update'
    delete ':id', to: 'bots#destroy'
    post '', to: 'bots#create'
    # TODO: These should move to their own controllers
    post 'add_hashtag', to: 'hashtags#add_hashtag_to_bot', as: :add_hashtag_to_bot
    post 'add_network', to: 'networks#add_network_to_bot', as: :add_network_to_bot
  end

  # TODO: Stop cheating
  get '/no1', to: 'bots#index', as: :new_network_membership
end
