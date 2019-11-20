Rails.application.routes.draw do
  get 'dashboard/index'
    get 'home/index'
    devise_for :users
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :posts
    root 'home#index'
    
    resources :notes
    get 'note/index'
    get 'like' => 'notes#like'
    get 'unlike' => 'notes#unlike'
end
