class Like < ActiveRecord::Base
  belongs_to :likable, polymorphic: true
  belongs_to :user

  scope :liked, -> { where(positive: true).count }
  scope :disliked, -> { where(positive: false).count }

end
