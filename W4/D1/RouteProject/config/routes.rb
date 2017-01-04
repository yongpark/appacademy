Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  get 'users/:id' => 'users#show', :as => 'user'
  get 'users' => 'users#index'
  post 'users' => 'users#create'
  get 'users/:id/edit' => 'users#edit', :as => 'edit_user'
  patch 'users/:id' => 'users#update'
  put 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'
  get 'users/new' => 'users#new', :as => 'new_user'


  resources :contact_shares, :only => [:create, :destroy]

  resources :users, :only => [:create, :destroy, :index, :show, :update] do
    resources :contacts, :only => [:index]
  end
end
