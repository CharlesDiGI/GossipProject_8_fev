require 'rails_helper'

RSpec.describe "welcome/show_welcome.html.erb", type: :view do

  context 'it says welcome' do
    it "displays 'welcome'" do
      # génére la page
      render
  
      # le contenu "Bievenue" doit être dans la page
      expect(rendered).to have_content 'BIENVENUE'
    end
  end
  
end
