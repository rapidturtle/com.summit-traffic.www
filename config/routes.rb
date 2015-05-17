Rails.application.routes.draw do
  get "contact", to: "static_pages#contact"
  get "manufacturers", to: "static_pages#manufacturers"
  root to: "static_pages#index"
end
