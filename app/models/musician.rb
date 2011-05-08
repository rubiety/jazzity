class Musician < ActiveRecord::Base
  belongs_to :instrument

  has_friendly_id :name, :use_slug => true

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  def name
    "#{first_name} #{last_name}".strip
  end

  def to_s
    name
  end
end
