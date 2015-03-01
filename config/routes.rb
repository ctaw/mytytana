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
  end

end
