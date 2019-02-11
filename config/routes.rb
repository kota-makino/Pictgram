Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  get 'users/new'
  #get 'signup',to:'users#new'
  root 'pages#index'
  # pagesコントローラーの indexアクションにルートを指定(root)
  get 'pages/help'

  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :topics
  resources :comments

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'

  get 'comments/index'
  post '/comments', to: 'comments#create'
end
