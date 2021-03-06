Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'static_pages#home'
  get '/about', :to => 'static_pages#about'
  get '/signup', :to => 'users#new'
  get '/login', :to => 'sessions#new'
  post '/login', :to => 'sessions#create'
  get '/logout', :to => 'sessions#destroy'
  resources :users do
    resources :games
  end
  resources :games, :only => [:show, :index]
end
