class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :likes, as: :likable
  has_many :tags, as: :taggable

  validates :title, :body, presence: true
  validates :title, length: { maximum: 200 }
  validates :body,  length: { maximum: 2000 }

end
