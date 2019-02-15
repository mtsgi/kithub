Rails.application.routes.draw do
  resources :apps do
    collection { get "search" }
  end
  get "apps/:id/download" => "apps#download"
  root "top#index"
end
