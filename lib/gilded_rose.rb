class GildedRose

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      update_aged_brie(item)
      update_sulfuras(item)
      update_backstage_passes(item)
      update_standard_products(item)
    end
  end

private

def update_aged_brie(item)
  if item.name == "Aged Brie"
    item.quality >= 50 ? item.quality : item.quality += 1
    item.sell_in <= 0 ? item.sell_in : item.sell_in -= 1
  end
end

def update_sulfuras(item)
  if item.name == "Sulfuras, Hand of Ragnaros"
    item.quality = item.quality
    item.sell_in = item.sell_in
  end
end

def update_backstage_passes(item)
  if item.name == "Backstage passes to a TAFKAL80ETC concert"
    if item.sell_in > 10
      max_quality(item, 1)
    elsif item.sell_in <= 10 && item.sell_in > 5
      max_quality(item, 2)
    elsif item.sell_in > 0 && item.sell_in <= 5
      max_quality(item, 3)
    else
      item.quality = 0
    end
    item.sell_in > 0 ? item.sell_in -= 1 : item.sell_in
  end
end

def max_quality(item, n)
  n.times do
    break if item.quality == 50
    item.quality += 1
  end
end

def update_standard_products(item)
  if item.name != "Backstage passes to a TAFKAL80ETC concert" && item.name != "Sulfuras, Hand of Ragnaros" && item.name != "Aged Brie"
    if item.sell_in > 0
      item.quality <= 0 ? item.quality : min_quality(item, 1)
      item.sell_in -= 1
    else
      item.sell_in = item.sell_in
      item.quality <= 0 ? item.quality : min_quality(item, 2)
    end
  end
end

def min_quality(item, n)
  n.times do
    break if item.quality == 0
    item.quality -= 1
  end
end

end
