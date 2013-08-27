Wikiwitness::Application.routes.draw do
  root to: 'static_pages#getting_started'

  get '/create_event', to: 'events#new'
  get '/mission', to: 'static_pages#mission'
  get '/guidelines', to: 'static_pages#guidelines'
  get '/faq', to: 'static_pages#faq'
  get '/contact_us', to: 'static_pages#contact'
  get '/getting_started', to: 'static_pages#getting_started'
  get '/search_area', to: 'static_pages#search'
  get '/search', to: 'search#search'
  get '/signup',  to: 'users#new'
  get '/signin',  to: 'sessions#new'
  get '/signout', to: 'sessions#destroy', via: :delete

  resources :events do
    resources :narratives, only: [:new, :create, :show, :edit, :destroy, :update] do
      resources :recommendations, only: [:new, :create, :edit, :destroy, :show]
    end
  end
  resources :users do
    resources :narratives, only: [:show, :edit, :update, :destroy]
  end
  resources :narratives, only: [:index, :new, :create, :edit, :destroy, :show, :update] do
    resources :recommendations, only: [:new, :create, :edit, :destroy]
  end
  resources :sessions, only: [:new, :create, :destroy]
end
