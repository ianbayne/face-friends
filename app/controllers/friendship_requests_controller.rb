class FriendshipRequestsController < ApplicationController
  include Wisper::Publisher

  before_action :authenticate_user!
  before_action :load_friendship_request, only: [:show, :accept, :deny]

  def create
    user = current_user
    friend = User.find_by(id: params[:user_id])
    friendship_request = FriendshipRequest.new(user: user, friend: friend)

    if friendship_request.save!
      publish(:friend_request, friendship_request, current_user, friend)

      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.js
      end
    end
  rescue StandardError => e
    puts e
  end

  def show
  end

  def accept
    Friendship.create!(user: @friendship_request.user, friend: @friendship_request.friend)

    redirect_to root_path
  end

  def deny
    @friendship_request.destroy!
    Notification.find_by(action: :friend_request, target_id: @friendship_request.id).destroy!

    redirect_to root_path
  end

private

  def load_friendship_request
    @friendship_request = FriendshipRequest.find(params[:id])
  end
end
