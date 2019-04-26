Friendship.seed_once(:id,
  { id: 1, user: User.first, friend: User.second },
  { id: 2, user: User.first, friend: User.third }
)
