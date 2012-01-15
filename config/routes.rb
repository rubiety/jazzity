Jazzity::Application.routes.draw do
  
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :musicians, :controllers => { :omniauth_callbacks => "musicians/authentications" }

  namespace :musicians do
    resources :authentications, :only => [:index, :destroy]
    resource :profile, :only => [:show, :edit, :update, :destroy]
  end

  resources :musicians, :only => [:index, :show]

  resources :searches, :only => [:create, :show] do
    get :autocomplete, :on => :collection
  end
  
  resources :keys, :only => [:show] do
    resources :tunes, :only => [:index, :show]
    resources :chord_qualities, :only => [:index, :show]
    resources :chords, :only => [:index, :show] do
      get :staff, :on => :member
      resources :voicings, :only => [:index, :show]
    end

    resources :progressions, :only => [:index, :show] do
      get :staff, :on => :member
      get :comments, :on => :member
    end

    resources :note_sequences, :path => "notes", :only => [:index, :show] do
      get :staff, :on => :member
    end

    resources :chord_sequences, :path => "chord-sequences", :only => [:show] do
      get :staff, :on => :member
    end

    resources :chord_note_sequences, :path => "chord-notes", :only => [:index, :show] do
      get :staff, :on => :member
    end

    resources :scales, :only => [:index, :show] do
      resources :modes, :only => [:index, :show]
    end
  end
  
  resources :tunes, :only => [:index, :show] do
    get "/vehicle/:vehicle_id", :action => :index, :on => :collection, :as => :by_vehicle
    get "/form/:form_id", :action => :index, :on => :collection, :as => :by_form
    get "/meter/:meter_id", :action => :index, :on => :collection, :as => :by_meter
  end

  resources :chord_qualities, :only => [:index, :show]
  resources :chords, :only => [:index, :show] do
    get :staff, :on => :member
    resources :voicings, :only => [:index, :show]
  end

  resources :scales, :only => [:index, :show] do
    get :staff, :on => :member

    resources :modes, :only => [:index, :show] do
      get :staff, :on => :member
    end
  end

  resources :progressions, :only => [:index, :show] do
    get :staff, :on => :member
    get :comments, :on => :member
  end

  resources :concepts, :only => [:index, :show] do
    get :comments, :on => :member
  end
  
  resources :note_sequences, :path => "notes", :only => [:show] do
    get :staff, :on => :member
  end

  resources :chord_sequences, :path => "chord-sequences", :only => [:show] do
    get :staff, :on => :member
  end

  resources :chord_note_sequences, :path => "chord-notes", :only => [:show] do
    get :staff, :on => :member
  end

  resources :comments
  resources :discussions
  resources :discussion_categories, :path => "discussion" do
    resources :discussions, :path => "d"
  end
  
  root :to => "dashboards#show"
  
end
