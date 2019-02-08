require 'rails_helper'

RSpec.describe PrivateMessage, type: :model do

  before(:each) do 
		@privatemessage = FactoryBot.create(:private_message)  	
  end

  it "has a valid factory" do
    # vérifie si la factory est valide
    expect(build(:private_message)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      # vérifie si le user est bien valide
      expect(@privatemessage).to be_a(PrivateMessage)
    end
    describe "#email" do
      # vérifie la présence de l'email
		end 
		describe "#phone_number" do
      # vérifie la présence du phone_number
	  end
  end

  context "associations" do
    # vérifie que l'utilisateur a plusieurs réservations en tant que guest
    # it { expect(@user).to have_many(:private_messages).with_foreign_key(:sender_id)  }  
  end

  # pending "add some examples to (or delete) #{__FILE__}"
end
