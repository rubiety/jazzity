Jazzity::Application.routes.draw do
  
  devise_for :musicians

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :searches, :only => [:create, :show] do
    get :autocomplete, :on => :collection
  end
  
  resources :keys, :only => [:show] do
    resources :tunes, :only => [:index, :show]
    resources :chord_qualities, :only => [:index, :show]
    resources :chords, :only => [:index, :show]
    resources :voicings, :only => [:index, :show]
    resources :progressions, :only => [:index, :show]
    resources :note_sequences, :path => "notes", :only => [:index, :show]
    resources :chord_sequences, :path => "chord-sequences", :only => [:show]
    resources :chord_note_sequences, :path => "chord-notes", :only => [:index, :show]
    resources :scales, :only => [:index, :show] do
      resources :modes, :only => [:index, :show]
    end
  end
  
  resources :tunes, :only => [:index, :show]
  resources :musicians, :only => [:index, :show]
  resources :chord_qualities, :only => [:index, :show]
  resources :chords, :only => [:index, :show]
  resources :scales, :only => [:index, :show] do
    resources :modes, :only => [:index, :show]
  end

  resources :voicings, :only => [:index, :show]
  resources :progressions, :only => [:index, :show]
  resources :concepts, :only => [:index, :show]
  resources :note_sequences, :path => "notes", :only => [:show]
  resources :chord_sequences, :path => "chord-sequences", :only => [:show]
  resources :chord_note_sequences, :path => "chord-notes", :only => [:show]
  
  root :to => "dashboards#show"
  
end
