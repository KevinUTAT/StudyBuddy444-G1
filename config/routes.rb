Rails.application.routes.draw do
  
  resources :pages
    resources :groups do
        collection do
            post 'join'
            post 'unjoin'
        end
    end
    get 'dashboard/index'
    get 'dashboard/checkout'
    get 'notes/donate'
    get 'home/index'
    devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :posts
    get 'delete_resume' => 'pages#delete_resume'
    get 'delete_transcript' => 'pages#delete_transcript'


    root 'home#index'
    
    resource :profiles

    resources :notes
    get 'note/index'
    get 'like' => 'notes#like'
    get 'unlike' => 'notes#unlike'
end
