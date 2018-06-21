require 'gilded_rose'

describe GildedRose do

  let(:items) { [Item.new(name="+5 Dexterity Vest", sell_in=1, quality=0),
                 Item.new(name="+5 Dexterity Vest", sell_in=0, quality=4),
                 Item.new(name="Aged Brie", sell_in=2, quality=0),
                 Item.new(name="Aged Brie", sell_in=2, quality=49),
                 Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=10, quality=40)]}
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

    it 'increases the quality of Aged Brie' do
      gilded_rose.update_quality()
      expect(items[2].quality).to eq 1
    end

    it 'increases the quality of item no more than up to 50' do
      gilded_rose.update_quality()
      gilded_rose.update_quality()
      expect(items[3].quality).to eq 50
    end

    it 'does not update the quality of Sulfuras' do
      gilded_rose.update_quality()
      expect(items[4].quality).to eq 40
    end

  end
end
