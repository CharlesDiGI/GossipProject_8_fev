require 'rails_helper'

RSpec.describe "static_pages/contact.html.erb", type: :view do

  context 'it show the contact' do
    it "shows the contact" do
      # génére la page
      render
  
      # le contenu "Bievenue" doit être dans la page
      expect(rendered).to have_content 'nous contacter'
    end
  end

end
