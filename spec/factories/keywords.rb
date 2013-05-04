# Read about factories at https://github.com/thoughtbot/factory_girl


FactoryGirl.define do
  sequence(:random_string) {|n| Faker::Lorem.words((3..5).to_a.sample).join(" ") }
  factory :keyword do
    content { generate(:random_string) }
    project
  end
end
