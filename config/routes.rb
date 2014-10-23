Rails.application.routes.draw do

  root 'welcome#index'


  resources :dashboards

  resources :inventories

  resources :customers

  resources :bookings

end
