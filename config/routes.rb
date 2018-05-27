Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'events/js/point/:id', to: 'events#js_map'
  get 'events/leave/:id', to: 'events#leave_event', as: 'leave_event'
  get 'events/join/:id', to: 'events#join_event', as: 'event_join'
  get 'events/find', to: 'events#find', as: 'events_find'

  resources :events do
    resources :posts, only: [:create]
  end

  resources :users, only: [:show, :index, :edit]

  get 'contact', to: 'static_pages#contact'
  get 'places/test'

  root 'static_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
