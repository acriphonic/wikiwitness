Wikiwitness::Application.routes.draw do
  root to: 'static_pages#getting_started'

  match '/create_event', to: 'events#new'
  match '/mission', to: 'static_pages#mission'
  match '/guidelines', to: 'static_pages#guidelines'
  match '/faq', to: 'static_pages#faq'
  match '/contact_us', to: 'static_pages#contact'
  match '/getting_started', to: 'static_pages#getting_started'
  match '/search_area', to: 'static_pages#search'
  match '/search', to: 'search#search'
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  resources :events do
    resources :narratives
  end
  resources :users do
    resources :narratives, only: [:show, :edit, :destroy]
  end
  resources :narratives, only: [:index, :new, :create, :edit, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
end
