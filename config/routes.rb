Rails.application.routes.draw do
  root 'presentation#index'

  resources :users, only: [:new, :create] do
    get :show, path: 'completed', as: 'completed', on: :collection
  end
end
