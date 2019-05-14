class NotificationSubscriber
  def post_liked(post, user, recipient)
    Notification.create!(target: post, actor: user, recipient: recipient, action: :liked_post)
  end
end
