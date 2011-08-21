class Musician < ActiveRecord::Base
  extend FriendlyId
  
  belongs_to :instrument

  friendly_id :name, :use => :slugged

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  def name
    "#{first_name} #{last_name}".strip
  end

  def to_s
    name
  end
end
