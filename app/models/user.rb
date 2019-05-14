class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships, dependent: :destroy
  has_many :friends,     through:   :friendships

  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments
  has_many :notifications, dependent: :destroy, foreign_key: :recipient_id

  def full_name
    "#{first_name} #{last_name}"
  end
end
