# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room1, class: Room do
    name 'Room1'
  end
  factory :room2, class: Room do
    name 'Room2'
  end
  factory :room3, class: Room do
    name 'Room3'
    max_count 3
  end
  factory :room4, class: Room do
    name 'Room4'
    max_count 1
  end
end
