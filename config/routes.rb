Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :sessions => 'sessions'}, :path_names => { :sign_in => 'login', :password => 'forgot', :confirmation => 'confirm', :unlock => 'unblock', :sign_out => 'logout'}
  as :user do
    # get 'register', :to => 'devise/registrations#new'
    delete 'logout', :to => 'sessions#destroy'
  end

  root 'welcome#index'

  # Admin Module
  namespace :admin do
    resources :dashboard
    resources :subjects
    resources :newsfeeds
    resources :students
    resources :courses
    resources :directories
    resources :events
    resources :sections
    resources :schedules
  end

  namespace :api do
    resources :subjects, :defaults => { :format => 'xml' }
    resources :newsfeeds, :defaults => { :format => 'xml' }
    resources :students, :defaults => { :format => 'xml' }
    resources :sessions, :defaults => { :format => 'xml' }
    resources :directories, :defaults => { :format => 'xml' }
    resources :events, :defaults => { :format => 'xml' }
    resources :schedules, :defaults => { :format => 'xml' }
  end

end