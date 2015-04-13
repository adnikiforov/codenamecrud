Rails.application.routes.draw do

  namespace :admin do
    root 'home#index'
    resources :courses
    resources :sections
    resources :lessons
  end

  devise_for :users
  resources :courses, only: [:index, :show], path: '' do
    resources :lessons, only: :show, path: '' do
      post :toggle_check, on: :member
    end
  end

  root 'courses#index'

end
