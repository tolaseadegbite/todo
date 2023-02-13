Rails.application.routes.draw do
  devise_for :users
  get '/contact', to: 'static_pages#contact'
  get '/help', to: 'static_pages#help'

  get 'lists/delete_completed'
  get 'lists/delete_uncompleted'
  get 'lists/delete_all'

  get 'lists/completed'
  get 'lists/uncompleted'

  
  # get 'static_pages/delete_completed'
  # get 'static_pages/delete_all'

  root "lists#index"

  resources :lists
end
