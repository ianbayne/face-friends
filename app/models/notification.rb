class Notification < ApplicationRecord
  enum action: {
    liked_post: 0
  }

  belongs_to :actor, class_name: User.name
  belongs_to :target, class_name: Post.name
  belongs_to :recipient, class_name: User.name
end
