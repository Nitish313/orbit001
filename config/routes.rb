Rails.application.routes.draw do
  get 'html_pages/home'
  get 'html_pages/help'
  get 'html_pages/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "html_pages#home"
end