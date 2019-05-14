class CommentsController < ApplicationController
  include Wisper::Publisher

  before_action :authenticate_user!

  def create
    user = current_user
    post = Post.find(params[:post_id])
    comment = post.comments.build(user: user,
                                  body: comment_params[:body],
                                  image: comment_params[:image])

    if comment.save!
      publish(:commented_on_post, post, current_user, post.user)

      redirect_back(fallback_location: root_path)
    end
  rescue StandardError => e
    puts e
  end

  def edit
  end

  def update
  end

  def destroy
  end
private

  def comment_params
    params.require(:comment).permit(:body, :image)
  end
end
