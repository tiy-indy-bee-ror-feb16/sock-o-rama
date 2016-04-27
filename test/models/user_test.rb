require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    user = build(:valid_user)
  end

  test "users have names" do
    user.name = ""
    refute user.save, "#{user} was not validated for name presence"
  end
end
