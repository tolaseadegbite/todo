Rails.application.routes.draw do
  devise_for :users
  get '/contact', to: 'static_pages#contact'
  get '/help', to: 'static_pages#help'

  root "static_pages#help"
end
