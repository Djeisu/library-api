Rails.application.routes.draw do
  namespace :api do
    scope :v1 do
      # User
      mount_devise_token_auth_for 'User', at: 'auth'
    end

    namespace :v1 do
      # Books
      get '/books', to: 'books#index'
      post '/book', to: 'books#create'

      # Author
    end
  end
end
