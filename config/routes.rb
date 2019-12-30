Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :appointments
  resources :diseases
  get '/render_list' => "appointments#render_list", as: :render_list
  resources :hosps
  root to: "appointments#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
