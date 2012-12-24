# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Naoto Koshikawa'
    email 'dummy@ppworks.jp'
    password 'hogehoge'
    password_confirmation 'hogehoge'
  end
end
