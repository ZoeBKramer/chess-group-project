Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :pieces, only: :update
  resources :boards, only: [:create, :show]
end
