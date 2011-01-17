Jazzity::Application.routes.draw do

  get "dashboards/show"

  devise_for :users

  resources :authentications
  resources :searches
  resources :chords
  resources :voicings
  resources :progressions
  resources :scales
  resources :notes_collections, :as => :notes
  resources :tunes

  root :to => "dashboards#index"

end
