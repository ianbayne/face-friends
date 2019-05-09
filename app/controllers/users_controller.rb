class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :new_comment, only: [:show]

  def index
    @users = User.where(
      'first_name ILIKE? OR last_name ILIKE? OR email ILIKE?',
      "%#{params[:search]}%",
      "%#{params[:search]}%",
      params[:search]
    ).order('first_name ASC')
  end

  def show
    @user = User.find(params[:id])
  end

private

  def new_comment
    @comment = Comment.new
  end
end
