Rails.application.routes.draw do
  # resources :keys
  get '/keys', to: 'keys#index'
  get '/keys/:key', to: 'keys#show'
  post '/keys', to: 'keys#create'
  patch '/keys/:key/:value', to: 'keys#update'
  delete '/keys/:key', to: 'keys#destroy'
  resources :keys, only: [:index, :show, :create, :update, :destroy], param: :key
end
