Jazzity::Application.routes.draw do

  devise_for :users

  resources :authentications
  resources :searches

  resources :musicians
  resources :chords
  resources :chord_qualities
  resources :voicings
  resources :progressions
  resources :scales
  resources :notes_collections, :as => "notes"
  resources :tunes
  resources :keys
  resources :concepts

  root :to => "dashboards#index"

end
