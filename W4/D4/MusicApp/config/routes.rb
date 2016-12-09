Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:create, :destroy, :edit, :show, :update] do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:create, :destroy, :edit, :show, :update]
  resources :notes, only: [:create, :destroy]
end
