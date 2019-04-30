class PostsController < ApplicationController
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
                 .includes(:user, :likes)
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    user = current_user
    post = user.posts.build(post_params)

    if post.save!
      redirect_to root_path
    end
  rescue StandardError => e
    puts e
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!
    redirect_to root_path
  end

  def edit
  end

  def update
  end

private

  def new_post
    @post = Post.new
  end

  def post_params
    params.require(:post).permit(:body, :image)
  end
end
