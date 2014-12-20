Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'home#index'

  devise_for :users, :path => '',
                     :path_names => { :sign_in  => "login",
                                      :sign_out => "logout",
                                      :sign_up  => "signup"
                                    }

  resources :users

end
