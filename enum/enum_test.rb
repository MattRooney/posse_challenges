require 'minitest/autorun'
require 'minitest/pride'
require_relative 'enum'

class EnumTest < Minitest::Test

  def test_any_works
    ages = [12, 11, 13, 14, 16, 20]
    condition = Proc.new { |a| a > 15 }
    assert Enum.any?(ages, condition)
    condition = Proc.new { |a| a > 1000 }
    refute Enum.any?(ages, condition)
  end

  def test_select_works
    collection = [1,2,3,4,5]
    condition = Proc.new { |a| a % 2 == 0 }
    assert_equal [2,4], Enum.select(collection, condition)
  end

  def test_map_works
    collection = %w(Rachel Joanne Nate)
    condition = Proc.new { |a| "#{a}!" }
    assert_equal %w(Rachel! Joanne! Nate!), Enum.map(collection, condition)
  end

  def test_reject_works
    collection = [1,2,3,4,5,6,7,8,9,10]
    condition = Proc.new { |a| a %2 != 0 }
    assert_equal [2,4,6,8,10], Enum.reject(collection, condition)
  end
end
