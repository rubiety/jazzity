class ProgressionFamily < ActiveRecord::Base
  has_many :progressions

  def to_s
    name
  end
end
