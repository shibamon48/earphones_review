Rails.application.routes.draw do
  get "user_sessions/login"
  get "user_sessions/logout"
root "reviews#index"

resources :users
resources :reviews

get "login" => "user_sessions#new", :as => :login
post "login" => "user_sessions#create"
delete "logout" => "user_sessions#destroy", :as => :logout

get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
