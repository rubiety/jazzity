class VoicingFamily < ActiveRecord::Base
  extend FriendlyId

  has_many :voicings

  friendly_id :name, :use => :slugged

  def to_s
    name
  end
end
