require 'test_helper'

class SizeTest < ActiveSupport::TestCase

  def setup
    @size = Size.new()
  end

  # Test good paramaters
  # Better to use X.valid? or x.save ??
  test "valid small size" do
    @size.attributes = { size: "S" }
    assert @size.save
    assert_equal "S", @size.size
    assert_equal 1, Size.count
  end

  test "valid medium size" do
    @size.attributes = { size: "M" }
    assert @size.save
    assert_equal "M", @size.size
    assert_equal 1, Size.count
  end

  test "valid large size" do
    @size.attributes = { size: "L" }
    assert @size.save
    assert_equal "L", @size.size
    assert_equal 1, Size.count
  end

  test "valid extra large size" do
    @size.attributes = { size: "XL" }
    assert @size.save
    assert_equal "XL", @size.size
    # assert_equal 1, Size.count
  end

  # Test bad patamaters

  test "invalid missing size" do
    @size.attributes = {}
    refute @size.save
  end

  test "invalid small size" do
    @size.attributes = { size: "s" }
    refute @size.save
  end

  test "invalid medium size" do
    @size.attributes = { size: "MM" }
    refute @size.save
  end

  test "invalid large size" do
    @size.attributes = { size: "1234" }
    refute @size.save
  end

  test "invalid extra large size" do
    @size.attributes = { size: "X" }
    refute @size.save
  end
end
