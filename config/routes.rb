Rails.application.routes.draw do
  devise_for :users
  root to: 'bots#index'

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
    get ':id/timeline', to: 'bots#timeline', as: :bot_timeline
    post ':id/timeline', to: 'bots#timeline', as: :bot_timeline_modal
    post ':bot_id/report', to: 'twitter#report', as: :twitter_report
  end

  scope 'hashtags' do
    post 'add', to: 'hashtags#add_hashtag_to_bot', as: :add_hashtag_to_bot
    get  'query', to: 'hashtags#query', as: :hashtags_query
  end

  scope 'networks' do
    post 'add', to: 'networks#add_network_to_bot', as: :add_network_to_bot
    get  'query', to: 'networks#query', as: :networks_query
  end

  # TODO: Stop cheating
  get '/no1', to: 'bots#index', as: :new_network_membership

  resources :timelines
  resources :hashtags
  resources :networks
end
