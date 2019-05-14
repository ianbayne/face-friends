class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @like_notifications = current_user.notifications
                                      .includes(:actor, :target)
                                      .where(action: 'liked_post')
  end
end
