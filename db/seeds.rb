# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Master::Job.create(name: 'エンジニア')
Master::Division.create(name: 'MIS事業部')
Master::Group.create(name: '調剤支援PF_G', division: Master::Division.take)

10.times do |i|
  User.create(
    master_group: Master::Group.take,
    first_name: "でも子#{i}号",
    last_name: '顔馴染',
    nearest_station: "JR荻窪駅#{i}番線",
    profile_text: "<h1>はじめまして！<h1><p>趣味はサウナに#{i}時間いることです！<p>",
    email: "sample#{i}@example.com",
    password: "Password#{i}",
    password_confirmation: "Password#{i}"
  )
end

UserJob.create(user: User.take, master_job: Master::Job.take)
UserTag.create(title: 'sample', description: 'tag description')
UserTagging.create(user_tag: UserTag.take, user: User.take)
UserTagHistory.create(user_tag: UserTag.take, user: User.take, status: :add)
UserTagHistory.create(user_tag: UserTag.take, user: User.take, status: :remove)
