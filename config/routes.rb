Rails.application.routes.draw do
  resources :houses, only: [:index]
  resources :cities, only: [:index]
end
