Rails.application.routes.draw do
  get 'contact', to: 'static_pages#contact', as: 'contact'
  get 'manufacturers', to: 'static_pages#manufacturers', as: 'manufacturers'
  root to: 'static_pages#index'
end
