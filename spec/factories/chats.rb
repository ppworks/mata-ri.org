# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chat do
    user_name "MyString"
    content "MyText"
    color "MyString"
    type "Chat::Message"
  end

  factory :chat_arrived, class: Chat::Arrived do
    user_name 'test'
    color '#333333'
  end

  factory :chat_left, class: Chat::Left do
    user_name 'test'
    color '#333333'
  end
end
