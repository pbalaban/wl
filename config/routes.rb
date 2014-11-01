Wl::Application.routes.draw do

  resources :places do
    resources :workouts
    resources :exercises do
      resources :exercise_items
    end
  end

  root "pages#home"

  get 'home', to: 'devise/sessions#new', as: 'home'
  get 'inside', to: 'workouts#index', as: 'inside'

  devise_for :users

  namespace :admin do
    root 'base#index'
    resources :users

  end

end
