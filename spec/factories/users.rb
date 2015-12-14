FactoryGirl.define do
  factory :user do
    username {Faker::Internet.user_name}
    password {Faker::Internet.password}
    firstname {Faker::Name.first_name}
    lastname {Faker::Name.last_name}
    birthday {"01/01/1990"}
    email {Faker::Internet.email}
  end
end
