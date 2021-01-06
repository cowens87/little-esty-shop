Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :merchants do
    resources :items
    resources :dashboard, only: [:index]
  end
end
get "/admin", to: "admin#dashboard"
