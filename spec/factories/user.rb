FactoryBot.define do

  factory :user do
    password = Faker::Internet.password(min_length:8)
    username                {Faker::Internet.username(15)}
    email                   {Faker::Internet.email}
    password                {password}
    password_confirmation   {password}
  end

end