Rails.application.routes.draw do
  root 'presentation#index'

  resources :users, only: [:new, :create] do
    get :show, path: 'completed', as: 'completed', on: :collection
  end

  namespace :api do
    namespace :v1 do
      resources :pins, only: :create do
        get 'check', on: :member
      end
    end
  end
end
