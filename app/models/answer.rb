class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :likes, as: :likable

  validates :body, presence: true
  validates :body, length: { maximum: 2000 }

end
