class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy

  validates :title, :body, presence: true
  validates :title, length: { maximum: 200 }
  validates :body,  length: { maximum: 2000 }

end
