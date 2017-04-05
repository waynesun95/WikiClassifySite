Rails.application.routes.draw do
  get 'index/home'

  get 'index/example'

  get 'index/about'

  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #root 'articles#index'
  root 'index#home'
end
