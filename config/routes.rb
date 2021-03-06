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
    resources :schedules do
      collection do 
        get "update_all"
        get "add_more"
      end
    end
    resources :section_schedules
    resources :grades do
      collection do 
        get "subject_update"
      end
    end
    resources :warnings

    resources :year_grades
  end

  namespace :api do
    resources :sections, :defaults => { :format => 'xml' }
    resources :subjects, :defaults => { :format => 'xml' }
    resources :newsfeeds, :defaults => { :format => 'xml' }
    resources :students, :defaults => { :format => 'xml' }
    resources :sessions, :defaults => { :format => 'xml' }
    resources :directories, :defaults => { :format => 'xml' }
    resources :events, :defaults => { :format => 'xml' }
    resources :schedules, :defaults => { :format => 'xml' }
    resources :section_schedules, :defaults => { :format => 'xml' }
    resources :grades, :defaults => { :format => 'xml' }
    resources :warnings, :defaults => { :format => 'xml' }
  end

end