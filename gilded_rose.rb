module GildedRose
  class Item
    attr_reader :name, :quality, :days_remaining

    def initialize(name:, days_remaining:, quality:)
      @name, @quality, @days_remaining = name, quality, days_remaining
    end

    def tick
      @days_remaining -= 1
      return if @quality == 0

      @quality -= 1
      @quality -= 1 if @days_remaining <= 0
    end
  end

  class Sulfuras < Item
    def tick
    end
  end

  class AgedBrie < Item
    def tick
      @days_remaining -= 1
      return if @quality >= 50

      @quality += 1
      @quality += 1 if @days_remaining <= 0 && @quality < 50
    end
  end

  class Backstage < Item
    def tick
      @days_remaining -= 1
      return @quality = 0 if @days_remaining < 0
      return if @quality >= 50

      @quality += 1
      return if @quality >= 50

      @quality += 1 if @days_remaining < 10
      return if @quality >= 50

      @quality += 1 if @days_remaining < 5
    end
  end

  class Conjured < Item
    def tick
      @days_remaining -= 1
      return if @quality == 0

      @quality -= 2
      @quality -= 2 if @days_remaining <= 0
    end
  end

  SPECIALIZED_CLASSES = {
    'Sulfuras, Hand of Ragnaros' => Sulfuras,
    'Aged Brie' => AgedBrie,
    'Backstage passes to a TAFKAL80ETC concert' => Backstage,
    'Conjured Mana Cake' => Conjured
  }.freeze

  def self.for(name:, days_remaining:, quality:)
    (SPECIALIZED_CLASSES[name] || Item).new(name: name, quality: quality, days_remaining: days_remaining)
  end
end
