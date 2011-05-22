Jazzity::Application.routes.draw do
  
  # TODO: Doesn't work with Rails 3.1:
  # ActiveAdmin.routes(self)

  resources :searches
  
  resources :keys do
    resources :tunes
    resources :chord_qualities
    resources :chords
    resources :voicings
    resources :progressions
    resources :notes_collections, :path => "notes"
    resources :chord_sequences, :path => "sequences"
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
  resources :notes_collections, :path => "notes"
  resources :chord_sequences, :path => "sequences"
  
  root :to => "dashboards#show"
  
end
