Rails.application.routes.draw do
  root to: 'tops#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :posts do
    collection do
     post :confirm
   end
  end

end
