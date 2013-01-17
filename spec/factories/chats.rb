# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chat do
    room_id 1
    user_id 1
    user_name "MyString"
    content "MyText"
    color "MyString"
    type ""
  end
end
