class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :new_post, only: [:index]

  def index
    posts_ids = []
    own_posts_ids = current_user.posts.pluck(:id)
    posts_ids << own_posts_ids

    current_user.friends.each do |friend|
      posts_ids << friend.posts.pluck(:id)
    end

    posts_ids = posts_ids.flatten

    @posts = Post.where(id: posts_ids)
                 .order(created_at: :desc)
                 .includes(:user)
  end

private

  def new_post
    @post = Post.new
  end
end
