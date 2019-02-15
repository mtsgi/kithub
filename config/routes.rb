Rails.application.routes.draw do
  resources :apps
  get "apps/:id/download" => "apps#download"
  root "top#index"
end
