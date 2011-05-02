Jazzity::Application.routes.draw do
  
  resources :searches
  
  resources :keys
  resources :concepts
  resources :musicians
  resources :tunes
  resources :chord_qualities
  resources :chords
  resources :voicings
  resources :progressions
  resources :scales
  resources :notes_collections, :as => "notes"
  
  root :to => "dashboards#index"
  
end
