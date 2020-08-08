FactoryBot.define do

  factory :user do
    username                {"name"}
    email                   {"aaa@email.com"}
    password                {"00000000"}
    password_confirmation   {"00000000"}
  end

end