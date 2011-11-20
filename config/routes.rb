Jazzity::Application.routes.draw do
  
  devise_for :musicians

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :searches do
    get :autocomplete, :on => :collection
  end
  
  resources :keys do
    resources :tunes
    resources :chord_qualities
    resources :chords
    resources :voicings
    resources :progressions
    resources :note_sequences, :path => "notes"
    resources :chord_sequences, :path => "chord-sequences"
    resources :chord_note_sequences, :path => "chord-notes"
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
  resources :note_sequences, :path => "notes"
  resources :chord_sequences, :path => "chord-sequences"
  resources :chord_note_sequences, :path => "chord-notes"
  
  root :to => "dashboards#show"
  
end
