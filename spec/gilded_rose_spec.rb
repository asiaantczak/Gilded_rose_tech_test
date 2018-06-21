require 'gilded_rose'

describe GildedRose do

  let(:items) { [Item.new(name="+5 Dexterity Vest", sell_in=1, quality=0),
                 Item.new(name="+5 Dexterity Vest", sell_in=0, quality=4),
                 Item.new(name="Aged Brie", sell_in=2, quality=0),
                 Item.new(name="Aged Brie", sell_in=2, quality=49),
                 Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=10, quality=40),
                 Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=11, quality=40),
                 Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=40),
                 Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=40),
                 Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=0, quality=40)] }

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

    it 'does not change the quality of Sulfuras' do
      gilded_rose.update_quality()
      expect(items[4].quality).to eq 40
    end

    it 'does not change the sell_in value of Sulfuras' do
      gilded_rose.update_quality()
      expect(items[4].sell_in).to eq 10
    end

    it 'increases the quality of Backstage passes by 2 when sell_in between 10 and 6' do
      gilded_rose.update_quality()
      expect(items[6].quality).to eq 42
    end

    it 'increases the quality of Backstage passes by 1 when sell_in is over 10' do
      gilded_rose.update_quality()
      expect(items[5].quality).to eq 41
    end

    it 'increases the quality of Backstage passes by 3 when sell_in between 5 and 1' do
      gilded_rose.update_quality()
      expect(items[7].quality).to eq 43
    end

    it 'descreases the quality of Backstage passes to 0 when sell_in 0' do
      gilded_rose.update_quality()
      expect(items[8].quality).to eq 0
    end

  end
end
