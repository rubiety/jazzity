class Musicians::TunesController < ApplicationController
  def index
    @musician = current_musician
    @musician.musician_tunes.build
  end
end
