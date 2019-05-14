class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications
                                 .includes(:target, :actor)
                                 .order('created_at DESC')
  end
end
