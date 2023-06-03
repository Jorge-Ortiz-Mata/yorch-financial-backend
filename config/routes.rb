Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      # REVENUES routes.
      resources :revenues, only: %i[create update destroy] do
        collection do
          get '/user', to: 'revenues#user_revenues'
        end
      end

      # PROFILES routes.
      resources :profiles, only: %i[show create update] do
        post '/avatar', to: 'profiles#upload_avatar', on: :member
      end

      # USERS routes.
      resources :users, except: %i[index new edit]

      # TEST routes.
      get 'articles/dummy', to: 'articles#dummy_articles'
    end

    # AUTHENTICATION routes.
    post '/login', to: 'sessions#login'
    delete '/logout', to: 'sessions#logout'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
