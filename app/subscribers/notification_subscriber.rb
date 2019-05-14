class NotificationSubscriber
  def liked_post(post, user, recipient)
    Notification.create!(
      target: post, actor: user, recipient: recipient, action: :liked_post
    )
  end

  def commented_on_post(post, user, recipient)
    Notification.create!(
      target:    post,
      actor:     user,
      recipient: recipient,
      action:    :commented_on_post
    )
  end
end
