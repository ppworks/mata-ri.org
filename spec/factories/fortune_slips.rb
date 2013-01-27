# coding: utf-8
FactoryGirl.define do
  factory :fortune_slip1, class: FortuneSlip do
    content "吉"
  end
  factory :fortune_slip2, class: FortuneSlip do
    content "凶"
  end
  factory :fortune_slip3, class: FortuneSlip do
    content "大吉"
  end
end
