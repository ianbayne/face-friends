User.seed_once(:id,
  { id: 1, first_name: '10', last_name: 'k', email: 'test1@example.com', password: 'password' },
  { id: 2, first_name: 'Roberta', last_name: 'Warren', email: 'test2@example.com', password: 'password' },
  { id: 3, first_name: 'Doc', last_name: 'Beck', email: 'test3@example.com', password: 'password' }
)
