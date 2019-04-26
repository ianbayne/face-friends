class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    posts_ids = []
    current_user.friends.each do |friend|
      posts_ids << friend.posts.pluck(:id)
    end
    posts_ids = posts_ids.flatten

    @posts = Post.where(id: posts_ids).order(created_at: :desc)
  end
end
