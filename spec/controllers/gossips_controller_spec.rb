require 'rails_helper'

RSpec.describe GossipsController, type: :controller do

  describe "GET #show_gossip" do
    it "returns http success" do
      get :show_gossip
      expect(response).to have_http_status(:success)
    end
  end

end
