FactoryBot.define do
  factory :invoice do
    number { "MyString" }
    amount { "9.99" }
    description { "MyString" }
    user { nil }
  end
end
