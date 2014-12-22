class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions
  has_many :answers

  validates :email, :password, :username, :nickname, presence: true
  validates :password, length: { minimum: 3, maximum: 32 }
  validates :username, :nickname, length: { maximum: 16 }
end
