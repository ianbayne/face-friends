class NotificationSubscriber
  def liked_post(post, user, recipient)
    Notification.create!(
      target_id: post.id, actor: user, recipient: recipient, action: :liked_post
    )
  end

  def commented_on_post(post, user, recipient)
    Notification.create!(
      target_id: post.id,
      actor:     user,
      recipient: recipient,
      action:    :commented_on_post
    )
  end

  def friend_request(friendship_request, user, recipient)
    Notification.create!(
      target_id: friendship_request.id, actor: user, recipient: recipient, action: :friend_request
    )
  end
end
