Rails.application.routes.draw do
  
  resources :pages
    resources :groups do
        collection do
            post 'join'
        end
    end
    get 'dashboard/index'
    get 'dashboard/checkout'
    get 'notes/donate'
    get 'home/index'
    devise_for :users, controllers: {
        sessions: 'users/sessions'
    }
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :posts
    root 'home#index'
    
    resource :profiles

    resources :notes
    get 'note/index'
    get 'like' => 'notes#like'
    get 'unlike' => 'notes#unlike'
end
