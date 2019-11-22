Rails.application.routes.draw do
    resources :groups do
        collection do
            post 'join'
        end
    end
    get 'dashboard/index'
    get 'home/index'
    devise_for :users, controllers: {
        sessions: 'users/sessions'
    }
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :posts
    root 'home#index'
    
    resources :user_profiles
    resources :notes
    get 'note/index'
    get 'like' => 'notes#like'
    get 'unlike' => 'notes#unlike'
end
