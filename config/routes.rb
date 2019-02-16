Rails.application.routes.draw do
  resources :apps do
    collection { get "search" }
  end
  get "apps/:id/download" => "apps#download"
  get "apps/:id/delete" => "apps#delete"
  root "top#index"
end
