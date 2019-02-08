FactoryBot.define do
  factory :comment do |comment|
    comment.commenteable { |c| c.association(:gossip) }
    content { "MyText" }
    user { FactoryBot.create(:user)}
  end
end
