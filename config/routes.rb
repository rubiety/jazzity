Jazzity::Application.routes.draw do
  
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
  
  resources :tunes, :only => [:index, :show]

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

  root :to => "dashboards#show"
  
end
