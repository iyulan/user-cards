require 'rails_helper'

feature 'Cards', js: true do
  let(:photo) { create(:photo) }
  let!(:exist_card) { create(:card, photo: photo) }

  before { visit cards_path }

  scenario 'load cards index page' do
    expect(page).to have_content(exist_card.full_name)
  end
end
