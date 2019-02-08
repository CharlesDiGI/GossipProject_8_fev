FactoryBot.define do
  factory :gossip do
    title { "MyString" }
    content { "MyString" }
    user { FactoryBot.create(:user)}
  end
end
