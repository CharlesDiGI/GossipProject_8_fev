FactoryBot.define do
  factory :like do |like|
    like.likeable { |l| l.association(:gossip) } # à bien relire !!
    user { FactoryBot.create(:user)}
  end
end
