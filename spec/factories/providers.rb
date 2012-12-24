# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :provider_facebook, class: Provider do
    name 'facebook'
  end
end
