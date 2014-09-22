Rails.application.routes.draw do
  get 'contact', to: 'static_pages#contact', as: 'contact'
  get 'proudcts', to: 'static_pages#products', as: 'products'
  root to: 'static_pages#index'
end
