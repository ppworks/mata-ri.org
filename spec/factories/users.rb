# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Naoto Koshikawa'
    email 'dummy@ppworks.jp'
    password 'hogehoge'
    password_confirmation 'hogehoge'
    content "head for content\nbody line1 for content\nbody line2 for content"
  end
end
