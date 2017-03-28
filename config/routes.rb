Rails.application.routes.draw do
  get  '/page_indices', to: 'page_indices#index'
  post '/page_indices', to: 'page_indices#create'
  get  '/page_indices/:id', to: 'page_indices#show'
end
