FactoryBot.define do
  factory :master_group, class: 'Master::Group' do
    name { "Webサービス開発科" }
    association :division, factory: :master_division
  end
end
