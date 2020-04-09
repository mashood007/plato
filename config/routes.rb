Rails.application.routes.draw do


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :boards, shallow: true do
    resources :cards do
      collection do
        get :get_children
      end
      resources :tasks
    end
    get 'tasks/change', to: 'tasks#change'

  end

  resources :users, only: [:index, :show, :edit] do 
    collection do
      post :add
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :home, only: [:new, :index]

  get '/logout', to: 'home#logout', as: 'logout'

  resources :organisations do
  	  collection do
    	get 'plan_choice'
    	patch 'subscribed'
      get 'alter'
  	  end
  end


  resources :subscriptions do
  	collection do 
  		get :details
      get :calculate
    end
  end


  namespace :api do
    namespace :v1 do
      resources :users
      resources :projects
      # resources :projects, only: [:index] do
      #   collection do
      #     get 'import'
      #   end
      # end
    end
  end

end
