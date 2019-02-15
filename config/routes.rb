Rails.application.routes.draw do
  resources :apps
  root "top#index"
end
