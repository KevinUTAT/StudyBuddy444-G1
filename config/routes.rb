Rails.application.routes.draw do
  get 'groups/index'
  get 'groups/show'
  get 'groups/new'
  get 'groups/edit'
  get 'dashboard/index'
  get 'home/index'
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts
  root 'home#index'
  
  resources :notes
  get 'note/index'
  get 'like' => 'notes#like'
  get 'unlike' => 'notes#unlike'
end
