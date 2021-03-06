class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :new_post, only: [:index]
  before_action :new_comment, only: [:index, :show]

  def index
    posts_ids = []
    own_posts_ids = current_user.posts.pluck(:id)
    posts_ids << own_posts_ids

    current_user.friends.includes(:posts).each do |friend|
      posts_ids << friend.posts.pluck(:id)
    end

    posts_ids = posts_ids.flatten

    @posts = Post.where(id: posts_ids)
                 .order(created_at: :desc)
                 .includes(:user, :likes, :comments)
  end

  def show
    @post = Post.find_by(id: params[:id])

    redirect_to root_url, notice: 'Post not found' unless @post
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

  def new_comment
    @comment = Comment.new
  end

  def post_params
    params.require(:post).permit(:body, :image)
  end
end
