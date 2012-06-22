Wikiwitness::Application.routes.draw do
  root to: 'static_pages#getting_started'

  match '/create_event', to: 'events#new'
  match '/add_narrative', to: 'narratives#new'
  match '/mission', to: 'static_pages#mission'
  match '/guidelines', to: 'static_pages#guidelines'
  match '/faq', to: 'static_pages#faq'
  match '/contact_us', to: 'static_pages#contact'
  match '/getting_started', to: 'static_pages#getting_started'
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  resources :narratives
  resources :events
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
