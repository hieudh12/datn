Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Authentication
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    unlock: 'users/unlocks',
    registrations: 'users/registrations'
  }
  post 'password/forgot', action: :forgot, controller: 'passwords'
  post 'password/reset', action: :reset, controller: 'passwords'
  get 'password/reset', action: :reset_new_password, controller: 'passwords'

  # Customer
  # homepage
  get '/', action: :index, controller: 'homepage', as: 'home'

  # recipes
  resources :recipes, only: [:index, :show]
  get 'author', action: :author, controller: 'recipes'

  # comments
  resources :comments
  post 'comments/reply', action: :create_reply, controller: 'comments'

  get 'profile', action: :profile, controller: 'users'
  post 'profile/update', action: :update_profile, controller: 'users'
  get 'profile/change-password', action: :change_password, controller: 'users'
  post 'profile/update-password', action: :update_password, controller: 'users'
  get 'profile/bookmarked-recipes', action: :show_bookmarked_recipes, controller: 'users'

  delete 'destroy-reply/:id', action: :destroy_reply, controller: 'comments', as: 'destroy-reply'

  put 'comments/:id/update-reply', action: :update_reply, controller: 'comments'



  #Templates
  # premium
  get 'premium/info', to: 'premium#info', as: 'premium_info'
  get 'premium/purchase', action: :get_purchase, controller: 'premium', as: 'get_purchase_premium'
  post 'premium/purchase', action: :post_purchase, controller: 'premium', as: 'post_purchase_premium'
  get 'premium/thankyou', to: 'premium#thank_you'

  # bookmark
  resources :bookmarks, only: [:create, :destroy]

  # rating
  resources :ratings, only: [:create, :destroy]

  # Admin
  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions'
  }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

#   Templates
#   get 'admins/index'
#   get 'single', action: :single, controller: 'homepage'
#   get 'category-post', action: :category_post, controller: 'homepage'
#   get 'category', action: :category, controller: 'homepage'
#   get 'contact', action: :contact, controller: 'homepage'
#   get 'recipe', action: :recipe, controller: 'homepage'

end
