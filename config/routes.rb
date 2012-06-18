Wikiwitness::Application.routes.draw do
  match '/signup', to: 'users#new'
  match '/create_event', to: 'events#new'
  match '/add_narrative', to: 'narratives#new'
  match '/mission', to: 'static_pages#mission'
  match '/guidelines', to: 'static_pages#guidelines'
  match '/faq', to: 'static_pages#faq'
  match '/contact_us', to: 'static_pages#contact'
  match '/getting_started', to: 'static_pages#getting_started'

  resources :narratives
  resources :events
  resources :users
end
