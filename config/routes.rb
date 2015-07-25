Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  get 'search'         => 'top#search'
  get '/indoorkadais/:indoorkadai_id/entry' => 'indoorkadais#entry'
  resources :indoors, shallow: true do
    resources :favorites, only: [:update, :destroy]
    resources :indoorkadais, only: [:show, :create, :edit, :update], shallow: true do
      resources :results, only: [:show, :create, :edit, :update]
    end
  end
  resources :users, only: [:show]
end
