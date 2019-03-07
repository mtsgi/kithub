Rails.application.routes.draw do
  resources :apps do
    collection { get "search" }
  end
  root "top#index"
  get "apps/:id/download" => "apps#download"
  get "apps/:id/delete" => "apps#delete"
end
