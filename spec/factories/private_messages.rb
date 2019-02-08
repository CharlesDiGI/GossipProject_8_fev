FactoryBot.define do
  factory :private_message do
    content { "MyText" }
    sender { FactoryBot.create(:user) }
  end
end
