Rails.application.routes.draw do
  devise_for :users
  root to: 'bots#index'

  resources :timelines

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
  end

  get '/no1', to: 'bots#index', as: :new_network_membership
  get '/no2', to: 'bots#index', as: :new_hashtag

end
