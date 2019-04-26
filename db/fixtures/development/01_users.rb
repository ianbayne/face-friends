User.seed_once(:id,
  { id: 1, email: 'test1@example.com', password: 'password' },
  { id: 2, email: 'test2@example.com', password: 'password' },
  { id: 3, email: 'test3@example.com', password: 'password' }
)
