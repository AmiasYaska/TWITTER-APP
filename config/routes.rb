Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    member do 
      post "create_comment"
    end
    scope module: :posts do
      resources :likes, only: [:create, :destroy]
    end
  end

  post 'profile/:id/follow', to: 'profile#follow', as: 'follow'
  post 'profile/:id/unfollow', to: 'profile#unfollow', as: 'unfollow'
  post 'profile/:id/accept', to: 'profile#accept', as: 'accept'
  post 'profile/:id/decline', to: 'profile#decline', as: 'decline'
  post 'profile/:id/cancel', to: 'profile#cancel', as: 'cancel'

  get 'profile/:id', to: 'profile#show', as: 'profile'
  
  # post_follower_path(@post) # => POST /posts/:post_id/follower
  # post_follower_path(@post, method: :delete) # => DELETE /posts/:post_id/follower

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "posts#index"
end