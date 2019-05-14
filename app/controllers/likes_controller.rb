class LikesController < ApplicationController
  include Wisper::Publisher

  before_action :authenticate_user!
  before_action :load_post

  def create
    like = current_user.likes.build(likeable: @post)

    if like.save!
      publish(:liked_post, @post, current_user, @post.user)

      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.js
      end
    end
  rescue StandardError => e
    puts e
  end

  def destroy
    like = Like.find_by(likeable: @post, user: current_user)

    if like.destroy!
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.js
      end
    end
  rescue StandardError => e
    puts e
  end

private

  def load_post
    @post = Post.find(params[:post_id])
  end
end
