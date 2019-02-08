FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    description { "MyText" }
    email { "MyString" }
    age { 1 }
    city { FactoryBot.create(:city) }
  end
end
