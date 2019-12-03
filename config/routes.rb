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
    get 'home/aboutus'
    get 'home/contact'
    get 'home/faq'
    get 'home/map'
    get 'home/privacy'
    get 'home/tos'
    devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :posts do
      resources :post_applications, only: [:create, :destroy]

      member do 
        patch 'accept_applicant'
        patch 'unaccept_applicant'
        # post 'pay_teenager'
      end
    end

    
    get 'delete_resume' => 'pages#delete_resume'
    get 'delete_transcript' => 'pages#delete_transcript'



    root 'home#index'
    
    resource :profiles

    resources :notes
    get 'note/index'
    get 'like' => 'notes#like'
    get 'unlike' => 'notes#unlike'
    get 'dislike' => 'notes#dislike'
    get 'undislike' => 'notes#undislike'
    
    
    resources :notes do
        resources :comments
    end
    resources :users do
        resources :comments
    end
end
