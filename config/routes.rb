Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, except: %i[index new edit]
      resources :posts
    end

    post '/login', to: 'sessions#login'
    delete '/logout', to: 'sessions#logout'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
