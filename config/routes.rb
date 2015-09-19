Rails.application.routes.draw do
  resources :users do
    resources :subs, only: [:show]
    resources :posts, only: [:show]
  end
  resource :session, only: [:create, :new, :destroy]
  resources :subs, except: [:destroy]
  resources :posts, except: [:index]
end
