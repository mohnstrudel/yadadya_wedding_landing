Rails.application.routes.draw do

  # devise_for :users, path: '/suckers'
  devise_for :users, skip: :all
  devise_scope :user do
    get '/users/sign_up'  => 'front/users/registrations#new',  as: :new_user_registration
    post '/users/sign_up'  => 'front/users/registrations#create', as: :user_registration
    get '/users/edit' => 'front/users/registrations#edit', as: :edit_user_registration
    delete '/users/sign_out' => 'front/users/registrations#destroy', as: :destroy_user_session

    get '/users/sign_in' => 'front/users/sessions#new', as: :new_user_session
    post '/users/sign_in'  => 'front/users/sessions#create', as: :user_session
  end
  
  scope module: :front do

    

    root 'static_pages#home'
    resources :requests
    resources :events, only: :show
  end

  namespace :admin do
    get '', to: 'dashboard#home', as: '/'
    resources :requests
    resources :events, except: :show
    resources :speakers, except: :show
    resources :organizers, except: :show
    resources :users
    resources :ticket_types, except: :show
    resources :archives, except: :show
    get '/requests/:id/decline', to: 'requests#decline', as: :decline_request
    get '/requests/:id/approve', to: 'requests#approve', as: :approve_request
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
