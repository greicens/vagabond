Rails.application.routes.draw do
  get '/' => 'welcome#index'

  get '/cities' => 'cities#index'
  # get '/cities/new' => 'cities#new'
  # post '/cities' => 'cities#create'
  # get '/cities/:id' => 'cities#show'

end
