require 'gilded_rose'

describe GildedRose do

  let(:items) {[Item.new("foo", 0, 0)]}
  let(:gilded_rose) { described_class.new(items) }

  describe '#update_quality' do
    it 'does not change the name' do
      gilded_rose.update_quality()
      expect(items[0].name).to eq "foo"
    end

    it 'does not lower the quality below 0' do
      gilded_rose.update_quality()
      expect(items[0].quality).to eq 0
    end
  end
end
