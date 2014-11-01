Wl::Application.routes.draw do

  resources :places do
    resources :workouts
    resources :exercises do
      resources :exercise_items
    end
  end

  root "pages#home"

  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"

  devise_for :users

  namespace :admin do
    root 'base#index'
    resources :users

  end

end
