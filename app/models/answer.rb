class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :body, presence: true
  validates :body, length: { maximum: 2000 }

end
