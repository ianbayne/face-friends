class FriendshipRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: User.name
end
