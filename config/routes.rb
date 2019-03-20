Rails.application.routes.draw do
  root to: 'tops#index'
  resources :users do
    member do
      get :likes
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  
  resources :posts do
    collection do
     post :confirm
   end
  end

  resources :favorites, only: [:create, :destroy]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
