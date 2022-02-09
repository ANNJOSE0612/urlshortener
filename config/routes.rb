Rails.application.routes.draw do
  root 'urls#new'

  resources :urls
  #get 'urls/index'
  #get 'urls/show'
  #get '/shorturl/:id', to: 'urls#show'
  #get '/shorturl', to: 'urls#new'

  get ':short_url', to: 'urls#send_to_url'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
