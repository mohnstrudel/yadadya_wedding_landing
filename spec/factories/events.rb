FactoryGirl.define do
  factory :event do
    sequence(:title) {|n| Faker::Lorem.word + " (#{n})"}
    sequence(:subtitle) {|n| Faker::Lorem.word + " (#{n})"}
    sortable_date { Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today) }
    facebook { Faker::Internet.url }
  end
end
