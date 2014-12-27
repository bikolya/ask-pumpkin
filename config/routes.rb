Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'home#index'

  devise_for :users, :path => '',
                     :path_names => { :sign_in  => "login",
                                      :sign_out => "logout",
                                      :sign_up  => "signup"
                                    }

  resources :users

  resources :questions do
    resources :answers, only: [:create]
  end

  get '/popular', to: "questions#popular"
  post '/dislike', to: "likes#dislike"
  post '/like', to: "likes#like"
  resources :tags, only: [:create, :destroy]
end
