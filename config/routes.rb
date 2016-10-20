Rails.application.routes.draw do
  # root "users/sessions#new"
  # devise_for :users
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      # resources :users
      resources :users
      resources :roles
      resources :policies
      resources :policies_users_roles
      resources :expense_definations
      resources :report_definations
      resources :custom_categories
      resources :amount_categories
      resources :default_categories
      resources :custom_tags
      resources :reports
      resources :expenses
 	end
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
