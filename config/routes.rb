Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "plants#index"

  resources :plants

  resources :plants do
    resources :events
  end
end
