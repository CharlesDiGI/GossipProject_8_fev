require 'rails_helper'

RSpec.describe "gossip/show_gossip.html.erb", type: :view do

  context 'it shows the gossip' do
    it "displays gossip content'" do

      assign(:gossip, build(:gossip, content: "oulalal quel gossip"))

      # génére la page
      render
  
      # le contenu créé doit être dans la page
      expect(rendered).to match 'oulalal quel gossip'

    end
  end

end
