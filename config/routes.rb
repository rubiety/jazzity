Jazzity::Application.routes.draw do

  resources :searches
  resources :chords
  resources :voicings
  resources :progressions
  resources :scales
  resources :notes_collections, :as => :notes

end
