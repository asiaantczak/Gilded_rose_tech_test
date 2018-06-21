require 'item'

describe Item do
  
  let(:item) { described_class.new(name="+5 Dexterity Vest", sell_in=1, quality=0) }

  describe 'initialize' do
    it 'has a name' do
      expect(item.name).to eq "+5 Dexterity Vest"
    end

    it 'has a sell_in value' do
      expect(item.sell_in).to eq 1
    end

    it 'has a quality' do
      expect(item.quality).to eq 0
    end
  end

  describe "#to_s" do
    it 'prints the name, sell in and quality of each item as a string' do
      expect(item.to_s).to eq "+5 Dexterity Vest, 1, 0"
    end
  end

end
