require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  fixtures(:all)

  test "Order validations" do
    o = Order.new
    o.save

    assert_equal ["can't be blank"], o.errors[:item]
    assert_equal ["can't be blank"], o.errors[:merchant]
    assert_equal ["can't be blank"], o.errors[:purchaser_name]
    assert_equal ["can't be blank", "is not a number"], o.errors[:purchase_count]
    assert_equal 5, o.errors.count
  end


  test "create an order" do
    o = Order.create(:purchaser_name => "test",
                  :purchase_count => 1,
                  :item => items(:one),
                  :merchant => merchants(:one))
    assert_equal 0, o.errors.count
    assert_equal "test", o.purchaser_name
    assert_equal 1, o.purchase_count
    assert_equal items(:one), o.item
    assert_equal merchants(:one), o.merchant
  end

end
