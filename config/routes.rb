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
  
  resources :tunes
  resources :musicians
  resources :chord_qualities
  resources :chords
  resources :scales do
    resources :modes
  end

  resources :voicings
  resources :progressions
  resources :concepts
  resources :notes_collections, :as => "notes"
  
  root :to => "dashboards#show"
  
end
