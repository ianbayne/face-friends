class Friendship < ApplicationRecord
  after_create  :create_inverse_friendship
  after_destroy :destroy_inverse_friendship

  belongs_to :user
  belongs_to :friend, class_name: User.name

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
