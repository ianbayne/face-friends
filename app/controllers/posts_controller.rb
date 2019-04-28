class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = current_user
    @post = @user.posts.build(post_params)

    if @post.save!
      redirect_to root_path
    else
      render :index
    end
  end

  def destroy
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
