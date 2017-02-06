Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'welcome#index', as: "root"
  # USER ROUTES
  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  # CITY ROUTES
  get '/cities', to: 'cities#index'
  get '/cities/new', to: 'cities#new', as: 'new_city'
  post '/cities', to: 'cities#create'
  get '/cities/:id', to: 'cities#show', as: 'city'

  # SESSION ROUTES
  get '/', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # POST ROUTES
  get '/cities/:city_id/posts', to: 'posts#new', as: 'new_post'
  post '/cities/:city_id/posts', to: 'posts#create', as: 'posts'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  get '/user/:user_id/posts/:id/edit', to: 'posts#edit', as: 'post'
  patch '/users/:user_id/posts/:id', to: 'posts#update'
  delete '/users/:user_id/posts/:id', to: 'posts#destroy', as: 'delete_post'

end
