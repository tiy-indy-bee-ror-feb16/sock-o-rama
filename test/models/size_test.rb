require 'test_helper'

class SizeTest < ActiveSupport::TestCase

  def setup
    @size = Size.new
  end

  # Test good paramaters

  test "valid small size" do
    @size.attributes = { size: "S" }
    assert @size.save
    assert_equal "S", @size.size
  end

  test "valid medium size" do
    @size.attributes = { size: "M" }
    assert @size.save
    assert_equal "M", @size.size
  end

  test "valid large size" do
    @size.attributes = { size: "L" }
    assert @size.save
    assert_equal "L", @size.size
  end

  test "valid extra large size" do
    @size.attributes = { size: "XL" }
    assert @size.save
    assert_equal "XL", @size.size
  end

  test "capitalize invalid small size" do
    @size.attributes = { size: "s" }
    @size.save
    assert @size.valid?, "Saved size as #{@size.size}"
    assert_equal "S", @size.size
  end

  # Test bad patamaters

  test "invalid missing size" do
    @size.attributes = {}
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

  test "invalid blank size" do
    @size.attributes = { size: "" }
    refute @size.save
  end
end
