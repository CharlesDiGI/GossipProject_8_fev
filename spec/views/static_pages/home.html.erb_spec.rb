require 'rails_helper'

RSpec.describe "static_pages/home", type: :view do

  context 'it says welcome' do
    it "displays 'welcome'" do

      assign(:user, build(:user, first_name: "Super Saiyan 2 Vegeta Brakus"))

      # génére la page
      render
  
      # le contenu "Bievenue" doit être dans la page
      expect(rendered).to have_content 'Bienvenue sur The Gossip Project'
      
      # le contenu créé doit être dans la page
      expect(rendered).to have_content 'Super Saiyan 2 Vegeta Brakus'

    end
  end


end
