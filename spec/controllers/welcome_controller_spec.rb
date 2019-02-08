require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #show_welcome" do
    it "returns http success" do
      get :show_welcome
      expect(response).to have_http_status(:success)
    end
  end

end
