User.all.each do |user|
  rand(10).times do
    Post.seed_once(
      user: user,
      body: Faker::Lorem.sentence(10),
      created_at: Faker::Time.between(10.days.ago, Date.today, :all)
    )
  end
end
