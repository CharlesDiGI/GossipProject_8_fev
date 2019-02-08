require 'rails_helper'

RSpec.describe "static_pages/team.html.erb", type: :view do
  
  context 'it show the team' do
    it "shows the team" do
      # génére la page
      render
  
      # le contenu "Bievenue" doit être dans la page
      expect(rendered).to have_content 'fait partie de la team'
    end
  end

end
