FactoryBot.define do
  factory :recipe do
    name { "MyString" }
    content { "MyText" }
    user { nil }
  end
end
