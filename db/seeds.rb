# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザーの作成
User.create!(
  [
    {
      name: 'test1',
      email: 'test1@email.com',
      password: 'password'
    },
    {
      name: 'test2',
      email: 'test2@email.com',
      password: 'password'
    },
    {
      name: 'test3',
      email: 'test3@email.com',
      password: 'password'
    },
    {
      name: 'test4',
      email: 'test4@email.com',
      password: 'password'
    }
  ]
)

User.all.each do |user|
  2.times do |i|
    user.communities.create!(
      user_id: user.id,
      name: "#{user.name}-#{i}"
    )
    user.posts.create!(
      user_id: user.id,
      message: "#{user.name}'s post#{i}"
    )
  end
end
