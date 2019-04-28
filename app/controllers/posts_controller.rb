class PostsController < ApplicationController
  before_action :authenticate_user!

  def show
    @post = Post.find(params[:id])
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_params)

    if @post.save!
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

  def post_params
    params.require(:post).permit(:body, :image)
  end
end
