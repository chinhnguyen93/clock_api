# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..10).each do |i|
  User.create(
    name: "User#{i}"
  )
end

(1..3).each do |i|
  Friend.create(
    follower_id: i,
    followee_id: i+1
  )
end

(1..3).each do |i|
  Clock.create(
    user_id: i,
    start_time: DateTime.now.change({ hour: 20 + i }),
    end_time: DateTime.now.change({ hour: 5 + i }) + 1.day
  )
end

# Friend clock lists
Clock.create(
  user_id: 2,
  start_time: DateTime.now.change({ hour: 22 }),
  end_time: DateTime.now.change({ hour: 5 }) + 1.day
)

Clock.create(
  user_id: 2,
  start_time: DateTime.now.change({ hour: 22 }),
  end_time: DateTime.now.change({ hour: 4 }) + 1.day
)

Clock.create(
  user_id: 2,
  start_time: DateTime.now.change({ hour: 22 }),
  end_time: DateTime.now.change({ hour: 3 }) + 1.day
)

Clock.create(
  user_id: 2,
  start_time: DateTime.now.change({ hour: 22 }),
  end_time: DateTime.now.change({ hour: 2 }) + 1.day
)

# Friend clocks not in past week
Clock.create(
  user_id: 2,
  start_time: DateTime.now.change({ hour: 22 }),
  end_time: DateTime.now.change({ hour: 1 }) + 1.day,
  created_at: DateTime.now - 8.days
)
