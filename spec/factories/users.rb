FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    jp_family_name        { '山田' }
    jp_name               { '海' }
    family_name           { 'ヤマダ' }
    name                  { 'カイ' }
    birth_day             { '1990-04-01' }
  end
end
