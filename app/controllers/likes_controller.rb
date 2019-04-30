class LikesController < ApplicationController
  before_action :load_post

  def create
    like = current_user.likes.build(post: @post)

    if like.save!
      redirect_back(fallback_location: root_path)
    end
  rescue StandardError => e
    puts e
  end

  def destroy
    like = Like.find_by(post: @post, user: current_user)

    if like.destroy!
      redirect_back(fallback_location: root_path)
    end
  rescue StandardError =>
    e
  end

private

  def load_post
    @post = Post.find(params[:post_id])
  end
end