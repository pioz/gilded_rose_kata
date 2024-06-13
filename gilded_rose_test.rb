require_relative 'gilded_rose'
require 'minitest/autorun'

class GildedRoseTest < Minitest::Test
  def test_normal_item_before_sell_date
    gilded_rose = GildedRose.new(name: 'Normal Item', days_remaining: 5, quality: 10)
    gilded_rose.tick

    assert_equal 4, gilded_rose.days_remaining
    assert_equal 9, gilded_rose.quality
  end

  def test_normal_item_on_sell_date
    gilded_rose = GildedRose.new(name: 'Normal Item', days_remaining: 0, quality: 10)
    gilded_rose.tick

    assert_equal -1, gilded_rose.days_remaining
    assert_equal 8, gilded_rose.quality
  end

  def test_normal_item_after_sell_date
    gilded_rose = GildedRose.new(name: 'Normal Item', days_remaining: -10, quality: 10)
    gilded_rose.tick

    assert_equal -11, gilded_rose.days_remaining
    assert_equal 8, gilded_rose.quality
  end

  def test_normal_item_of_zero_quality
    gilded_rose = GildedRose.new(name: 'Normal Item', days_remaining: 5, quality: 0)
    gilded_rose.tick

    assert_equal 4, gilded_rose.days_remaining
    assert_equal 0, gilded_rose.quality
  end

  def test_aged_brie_before_sell_date
    gilded_rose = GildedRose.new(name: 'Aged Brie', days_remaining: 5, quality: 10)
    gilded_rose.tick

    assert_equal 4, gilded_rose.days_remaining
    assert_equal 11, gilded_rose.quality
  end

  def test_aged_brie_before_sell_date_with_max_quality
    gilded_rose = GildedRose.new(name: 'Aged Brie', days_remaining: 5, quality: 50)
    gilded_rose.tick

    assert_equal 4, gilded_rose.days_remaining
    assert_equal 50, gilded_rose.quality
  end

  def test_aged_brie_on_sell_date
    gilded_rose = GildedRose.new(name: 'Aged Brie', days_remaining: 0, quality: 10)
    gilded_rose.tick

    assert_equal -1, gilded_rose.days_remaining
    assert_equal 12, gilded_rose.quality
  end

  def test_aged_brie_on_sell_date_near_max_quality
    gilded_rose = GildedRose.new(name: 'Aged Brie', days_remaining: 0, quality: 49)
    gilded_rose.tick

    assert_equal -1, gilded_rose.days_remaining
    assert_equal 50, gilded_rose.quality
  end

  def test_aged_brie_on_sell_date_with_max_quality
    gilded_rose = GildedRose.new(name: 'Aged Brie', days_remaining: 0, quality: 50)
    gilded_rose.tick

    assert_equal -1, gilded_rose.days_remaining
    assert_equal 50, gilded_rose.quality
  end

  def test_aged_brie_after_sell_date
    gilded_rose = GildedRose.new(name: 'Aged Brie', days_remaining: -10, quality: 10)
    gilded_rose.tick

    assert_equal -11, gilded_rose.days_remaining
    assert_equal 12, gilded_rose.quality
  end

  def test_aged_brie_after_sell_date_with_max_quality
    gilded_rose = GildedRose.new(name: 'Aged Brie', days_remaining: -10, quality: 50)
    gilded_rose.tick

    assert_equal -11, gilded_rose.days_remaining
    assert_equal 50, gilded_rose.quality
  end

  def test_sulfuras_before_sell_date
    gilded_rose = GildedRose.new(name: 'Sulfuras, Hand of Ragnaros', days_remaining: 5, quality: 80)
    gilded_rose.tick

    assert_equal 5, gilded_rose.days_remaining
    assert_equal 80, gilded_rose.quality
  end

  def test_sulfuras_on_sell_date
    gilded_rose = GildedRose.new(name: 'Sulfuras, Hand of Ragnaros', days_remaining: 0, quality: 80)
    gilded_rose.tick

    assert_equal 0, gilded_rose.days_remaining
    assert_equal 80, gilded_rose.quality
  end

  def test_sulfuras_after_sell_date
    gilded_rose = GildedRose.new(name: 'Sulfuras, Hand of Ragnaros', days_remaining: -10, quality: 80)
    gilded_rose.tick

    assert_equal -10, gilded_rose.days_remaining
    assert_equal 80, gilded_rose.quality
  end

  def test_backstage_pass_long_before_sell_date
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 11, quality: 10)
    gilded_rose.tick

    assert_equal 10, gilded_rose.days_remaining
    assert_equal 11, gilded_rose.quality
  end

  def test_backstage_pass_long_before_sell_date_at_max_quality
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 11, quality: 50)
    gilded_rose.tick

    assert_equal 10, gilded_rose.days_remaining
    assert_equal 50, gilded_rose.quality
  end

  def test_backstage_pass_medium_close_to_sell_date_upper_bound
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 10, quality: 10)
    gilded_rose.tick

    assert_equal 9, gilded_rose.days_remaining
    assert_equal 12, gilded_rose.quality
  end

  def test_backstage_pass_medium_close_to_sell_date_upper_bound_at_max_quality
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 10, quality: 50)
    gilded_rose.tick

    assert_equal 9, gilded_rose.days_remaining
    assert_equal 50, gilded_rose.quality
  end

  def test_backstage_pass_medium_close_to_sell_date_lower_bound
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 6, quality: 10)
    gilded_rose.tick

    assert_equal 5, gilded_rose.days_remaining
    assert_equal 12, gilded_rose.quality
  end

  def test_backstage_pass_medium_close_to_sell_date_lower_bound_at_max_quality
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 6, quality: 50)
    gilded_rose.tick

    assert_equal 5, gilded_rose.days_remaining
    assert_equal 50, gilded_rose.quality
  end

  def test_backstage_pass_very_close_to_sell_date_upper_bound
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 5, quality: 10)
    gilded_rose.tick

    assert_equal 4, gilded_rose.days_remaining
    assert_equal 13, gilded_rose.quality
  end

  def test_backstage_pass_very_close_to_sell_date_upper_bound_at_max_quality
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 5, quality: 50)
    gilded_rose.tick

    assert_equal 4, gilded_rose.days_remaining
    assert_equal 50, gilded_rose.quality
  end

  def test_backstage_pass_very_close_to_sell_date_lower_bound
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 1, quality: 10)
    gilded_rose.tick

    assert_equal 0, gilded_rose.days_remaining
    assert_equal 13, gilded_rose.quality
  end

  def test_backstage_pass_very_close_to_sell_date_lower_bound_at_max_quality
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 1, quality: 50)
    gilded_rose.tick

    assert_equal 0, gilded_rose.days_remaining
    assert_equal 50, gilded_rose.quality
  end

  def test_backstage_pass_on_sell_date
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 0, quality: 10)
    gilded_rose.tick

    assert_equal -1, gilded_rose.days_remaining
    assert_equal 0, gilded_rose.quality
  end

  def test_backstage_pass_after_sell_date
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: -10, quality: 10)
    gilded_rose.tick

    assert_equal -11, gilded_rose.days_remaining
    assert_equal 0, gilded_rose.quality
  end

  def test_conjured_item_before_sell_date
    skip

    gilded_rose = GildedRose.new(name: 'Conjured Mana Cake', days_remaining: 5, quality: 10)
    gilded_rose.tick

    assert_equal 4, gilded_rose.days_remaining
    assert_equal 8, gilded_rose.quality
  end

  def test_conjured_item_before_sell_date_at_zero_quantity
    skip

    gilded_rose = GildedRose.new(name: 'Conjured Mana Cake', days_remaining: 5, quality: 0)
    gilded_rose.tick

    assert_equal 4, gilded_rose.days_remaining
    assert_equal 0, gilded_rose.quality
  end

  def test_conjured_item_on_sell_date
    skip

    gilded_rose = GildedRose.new(name: 'Conjured Mana Cake', days_remaining: 0, quality: 10)
    gilded_rose.tick

    assert_equal -1, gilded_rose.days_remaining
    assert_equal 6, gilded_rose.quality
  end

  def test_conjured_item_on_sell_date_at_zero_quality
    skip

    gilded_rose = GildedRose.new(name: 'Conjured Mana Cake', days_remaining: 0, quality: 0)
    gilded_rose.tick

    assert_equal -1, gilded_rose.days_remaining
    assert_equal 0, gilded_rose.quality
  end

  def test_conjured_item_after_sell_date
    skip

    gilded_rose = GildedRose.new(name: 'Conjured Mana Cake', days_remaining: -10, quality: 10)
    gilded_rose.tick

    assert_equal -11, gilded_rose.days_remaining
    assert_equal 6, gilded_rose.quality
  end

  def test_conjured_item_after_sell_date_at_zero_quality
    skip

    gilded_rose = GildedRose.new(name: 'Conjured Mana Cake', days_remaining: -10, quality: 0)
    gilded_rose.tick

    assert_equal -11, gilded_rose.days_remaining
    assert_equal 0, gilded_rose.quality
  end
end
