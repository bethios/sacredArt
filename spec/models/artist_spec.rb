require 'rails_helper'

RSpec.describe Artist, type: :model do
  let(:artist) { Artist.create!(name: 'test artist', body: 'test artist body' ) }

  let(:name){ "test artist" }
  let(:body){ 'test artist body' }
  let(:category) { Category.create!( name: "Original Art", image: "original.jpg") }
  let(:category_id) { category.id}

  let(:artist) { category.artists.create!(name: name, body: body, category_id: category_id) }

  it { is_expected.to belong_to(:category)}

  describe "attributes" do
    it "has name and body attributes" do
      expect(artist).to have_attributes(name: name, body: body, category_id: category_id)
    end
  end
end
