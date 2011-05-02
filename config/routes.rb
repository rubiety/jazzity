Jazzity::Application.routes.draw do

  devise_for :users

  resources :authentications
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
