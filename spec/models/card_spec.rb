require 'rails_helper'

describe Card do
  let(:photo) { create(:photo) }
  let(:card) { create(:card, photo: photo) }

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:gender) }
  end

  describe 'associtations' do
    it { should belong_to(:photo) }
  end

  describe '.full_name' do
    it 'return full name' do
      expect(card.full_name).to eq("#{card.first_name} #{card.last_name}")
    end
  end

  describe '.as_json' do
    it 'return included image url json' do
      expect(card.as_json['image']['url']).to eq(photo.image.url)
    end
  end
end
