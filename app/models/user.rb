class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions
  has_many :answers
  has_many :likes

  mount_uploader :avatar, AvatarUploader

  validates :email, :password, :username, :nickname, presence: true
  validates :email, :username, uniqueness: true
  validates :password, length: { minimum: 3, maximum: 32 }
  validates :username, :nickname, length: { maximum: 16 }

  def liked?(entity)
    likes.find_by(likable: entity, positive: true)
  end

  def disliked?(entity)
    likes.find_by(likable: entity, positive: false)
  end

  def like(entity)
    like = likes.find_or_initialize_by(likable: entity)
    like.update(positive: true)
  end

  def dislike(entity)
    like = likes.find_or_initialize_by(likable: entity)
    like.update(positive: false)
  end

end
