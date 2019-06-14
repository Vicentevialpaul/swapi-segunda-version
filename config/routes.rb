Rails.application.routes.draw do
  get 'starship/index'

  get 'planet/index'

  get 'character/index'

  get 'pelicula/index'
  get    '/search',     to: 'welcome#search'
  root 'welcome#index'
  get '/welcome', to: 'welcome#index' 
  get '/pelicula', to: 'pelicula#index'
  get '/character', to: 'character#index'
  get '/planet', to: 'planet#index'
  get '/starship', to: 'starship#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
