require 'rails_helper'

RSpec.describe City, type: :model do


  before(:each) do 
		@city = FactoryBot.create(:city)  	
  end

  it "has a valid factory" do
    # vérifie si la factory est valide
    expect(build(:city)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      # vérifie si le user est bien valide
      expect(@city).to be_a(City)
    end

    describe "#zip_code" do
      # vérifie la présence de zip_code
      it { should validate_presence_of(:zip_code) }
      # vérifie l'unicité de zip_code
      it { should validate_uniqueness_of(:zip_code).case_insensitive }
      # verifie différentes valeurs de zip_code qui doivent être correctes
      it { should allow_values("75011").for(:zip_code) }
      it { should allow_values("09734").for(:zip_code) }
      # vérifie différentes valeurs de zip_code qui ne doivent pas être correctes
      it { should_not allow_values("AE345").for(:zip_code) }
      it { should_not allow_values("097349").for(:zip_code) }
    end
    
  end

  context "associations" do
    # vérifie que l'utilisateur a plusieurs réservations en tant que guest
    # it { expect(@user).to have_many(:private_messages).with_foreign_key(:sender_id)  }  
  end

  # pending "add some examples to (or delete) #{__FILE__}"
end
