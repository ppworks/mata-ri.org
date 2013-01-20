# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chat do
    user_name "MyString"
    content "MyText"
    color "MyString"
    type "Chat::Message"
  end
end
