Rails.application.routes.draw do
  resources :users do
    resources :subs, only: [:edit]
    resources :posts, only: [:edit, :update]
  end
  resource :session, only: [:create, :new, :destroy]
  resources :subs, except: [:destroy, :edit]
  resources :posts, except: [:index, :edit, :update]
end
