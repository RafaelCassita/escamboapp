Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  namespace :backoffice do
    get 'admins/index'
  end
  namespace :backoffice do
  end
  get 'backoffice', to: 'backoffice/dashboard#index'
  get 'admin', to: 'backoffice/admins#index'


  namespace :backoffice do
    resources :categories, except: [:show, :destroy]
    resources :admins, except: [:show]
    resources :send_mail, only: [:edit, :create]
    get 'dashboard', to: 'dashboard#index'
    get 'admins/index'
  end

  namespace :site do
    get 'home', to: 'home#index'
    get 'search', to: 'search#ads'

    namespace :profile do
      resources :dashboard, only: [:index]
      resources :ads, only: [:index, :edit, :update, :new, :create]
      resources :my_profile, only: [:edit, :update]
    end

    resources :ad_detail, only: [:show]
    resources :categories, only: [:show]
    resources :comments, only: [:create]
  end

  devise_for :admins, :skip => [:registrations]
  devise_for :members, controllers: {
    sessions: 'members/sessions',
    registrations: 'members/registrations'
  }


  root 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
