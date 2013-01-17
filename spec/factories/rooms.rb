# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room do
    name "MyText"
    content "MyText"
    last_arrived_at "2013-01-17 22:00:46"
    last_left_at "2013-01-17 22:00:46"
    room_users_count 1
  end
end
