require 'rails_helper'

RSpec.describe "authors/show", type: :view do

  context 'some context' do  
    it 'should display something' do
      assign(:user, build(:user, first_name: "Super Saiyan 2 Vegeta Brakus"))

      # génére la page
      render
  
      # le contenu créé doit être dans la page
      expect(rendered).to have_content 'Super Saiyan 2 Vegeta Brakus'

    end
  end

end
