Rails.application.routes.draw do
  get  '/page_indices', to: 'page_indices#index'
  post '/page_indices', to: 'page_indices#create'
end
