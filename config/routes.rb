Rails.application.routes.draw do
  get 'note/index'
    devise_for :users
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :posts
    get "about", to:"pages#about"
    root 'posts#index'
    
    resources :notes
end
