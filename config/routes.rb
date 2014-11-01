Wl::Application.routes.draw do

  resources :places do
    resources :workouts do
      resources :exercise_items
    end
    resources :exercises
  end

  root 'pages#home'

  get 'home', to: 'devise/sessions#new', as: 'home'

  devise_for :users

  namespace :admin do
    root 'base#index'
    resources :users
  end

  namespace :api do
    scope :v1 do
      resources :users, only: :create
      resources :sessions, only: :create
      resources :workouts, only: %i[index show destroy]
      resources :places, except: %i[new edit update] do
        resources :workouts, only: %i[index create]
      end
    end
  end
end
