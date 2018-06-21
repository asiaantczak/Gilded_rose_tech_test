require 'gilded_rose'

describe GildedRose do

  let(:items) { [Item.new(name="+5 Dexterity Vest", sell_in=1, quality=0),
                 Item.new(name="+5 Dexterity Vest", sell_in=0, quality=4)]}
  let(:gilded_rose) { described_class.new(items) }

  describe '#update_quality' do
    it 'does not change the name' do
      gilded_rose.update_quality()
      expect(items[0].name).to eq "+5 Dexterity Vest"
    end

    it 'does not lower the quality below 0' do
      gilded_rose.update_quality()
      expect(items[0].quality).to eq 0
    end

    it 'degrades quality twice as fast for items with sellIn 0' do
      gilded_rose.update_quality()
      expect(items[1].quality).to eq 2
    end

  end
end
