Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  get '/help', to: 'html_pages#help'
  get '/about', to: 'html_pages#about'
  get '/contact', to: 'html_pages#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "html_pages#home"
  resources :users do
    member do
      get :following, :followers
    end
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :snapshots, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
