require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  def setup
    @ten_k  = users(:ten_k)
    @murphy = users(:murphy)
    @ten_k.friendships.create!(friend: @murphy)
  end

  test 'creating a friendship creates the inverse friendship as well' do
    assert_equal(1, @ten_k.friends.count)
    assert_equal(1, @murphy.friends.count)
    assert_equal(2, Friendship.count)
  end

  test 'destroying a friendship destroys the inverse friendship as well' do
    Friendship.find_by(user: @murphy, friend: @ten_k).destroy

    assert_equal(0, Friendship.count)
  end
end
