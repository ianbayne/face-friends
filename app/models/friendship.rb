class Friendship < ApplicationRecord
  after_create  :create_inverse_friendship
  after_destroy :destroy_inverse_friendship

  belongs_to :user
  belongs_to :friend, class_name: User.name

  def self.mutual_friendships(user_a, user_b)
    Friendship.where(user: user_a, friend: user_b)
      .or(Friendship.where(user: user_b, friend: user_a))
  end

private

  def create_inverse_friendship
    unless Friendship.find_by(user: friend)
      friend.friendships.create!(friend: user)
    end
  end

  def destroy_inverse_friendship
    inverse_friendship = Friendship.find_by(user: friend, friend: user)
    inverse_friendship.destroy if inverse_friendship
  end
end
