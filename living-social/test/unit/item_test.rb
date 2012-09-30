require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  test "Item validations" do
    i = Item.new
    i.save

    assert_equal ["can't be blank"], i.errors[:description]
    assert_equal ["can't be blank", "is not a number"], i.errors[:price]
    assert_equal 3, i.errors.count
  end

  test "create an item" do
    i = Item.create(:description => "item", :price => 1.0)

    assert_equal 0, i.errors.count
    assert_equal "item", i.description
    assert_equal 1.0, i.price
  end

end
