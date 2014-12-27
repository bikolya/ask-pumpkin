class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true

  scope :most_popular, -> (count = 20) { order('taggings_count desc').limit(count) }
end
