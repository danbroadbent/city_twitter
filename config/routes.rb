Rails.application.routes.draw do
  get '/', to: 'results#index'

  resources :tweets, only: [:index]
end
