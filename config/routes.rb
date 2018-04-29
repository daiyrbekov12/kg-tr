Rails.application.routes.draw do
  resources :vnas
  resources :categories
  resources :wordlists
  get 'user/index'

  get 'dictionary/about'

  get 'dictionary/help'

  get 'dictionary/contact'


  get 'words/popular'
  get 'wordrepos/bookmark'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # devise_for :users
  devise_for :users, :path_prefix => 'my'

  root "words#index"
  resources :wordrepos

  resources :words
  resources :languages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
