Jazzity::Application.routes.draw do

  devise_for :users

  resources :authentications
  resources :searches

  resources :keys
  resources :concepts do
    resources :comments
    resources :suggestions
  end

  resources :musicians do
    resources :comments
    resources :suggestions
  end

  resources :tunes do
    resources :comments
    resources :suggestions
  end

  resources :chord_qualities
  resources :chords do
    resources :comments
  end

  resources :voicings do
    resources :comments
    resources :suggestions
  end

  resources :progressions do
    resources :comments
    resources :suggestions
  end

  resources :scales do
    resources :comments
    resources :suggestions
  end

  resources :notes_collections, :as => "notes"

  root :to => "dashboards#index"

end
