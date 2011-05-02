Jazzity::Application.routes.draw do
  
  resources :searches
  
  resources :keys do
    resources :chords
    resources :voicings
    resources :progressions
    resources :notes_collections, :as => "notes"
    resources :scales do
      resources :modes
    end
  end
  
  resources :concepts
  resources :musicians
  resources :tunes
  resources :chord_qualities
  resources :chords
  resources :voicings
  resources :progressions
  resources :notes_collections, :as => "notes"
  resources :scales do
    resources :modes
  end
  
  root :to => "dashboards#index"
  
end
