class KeysController < ApplicationController
  before_filter :find_key, :except => [:index, :new, :create]

  def index
  end

  def show
  end


  protected

  def find_key
    @key = Key[params[:id]]
  end
end
