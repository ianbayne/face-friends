class Notification < ApplicationRecord
  enum action: {
    liked_post:         0,
    commented_on_post: 10
  }

  belongs_to :actor, class_name: User.name
  belongs_to :target, class_name: Post.name
  belongs_to :recipient, class_name: User.name

  def action
    return 'liked' if liked_post?
    return 'commented on' if commented_on_post?
  end
end
