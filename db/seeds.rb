# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
JOB_NAME = %w(エンジニア セールス ディレクター オペ マーケター 総務 DS 社長).freeze
JOB_NAME.each do |name|
  Master::Job.create(name: name)
end

DIVISION_AND_GROUP_NAME = Hash.new.tap do |h|
  h["MS事業部"] = %w(BD部 MP部)
  h["MIS事業部"] = %w(調剤支援 開業支援 キャリア)
  h["社長室"] = %w(人事 新規事業推進)
end

DIVISION_AND_GROUP_NAME.each do |k, v|
  division = Master::Division.create(name: k)

  v.each do |name|
    Master::Group.create(name: name, division: division)
  end
end

master_group_ids = Master::Group.ids
10.times do |i|
  User.create(
    master_group_id: master_group_ids.sample,
    first_name: "でも子#{i}号",
    last_name: '顔馴染',
    nearest_station: "JR荻窪駅#{i}番線",
    profile_text: "<h1>はじめまして！<h1><p>趣味はサウナに#{i}時間いることです！<p>",
    email: "sample#{i}@example.com",
    password: "Password#{i}",
    password_confirmation: "Password#{i}"
  )
end

master_job_ids = Master::Job.ids
user_ids = User.ids
user_ids.each do |uid|
  UserJob.create(user_id: uid, master_job_id: master_job_ids.sample)
end

UserTag.create(title: 'sample', description: 'tag description')
UserTagging.create(user_tag: UserTag.take, user: User.take)
UserTagHistory.create(user_tag: UserTag.take, user: User.take, status: :add)
UserTagHistory.create(user_tag: UserTag.take, user: User.take, status: :remove)
