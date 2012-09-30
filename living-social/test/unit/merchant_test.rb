require 'test_helper'

class MerchantTest < ActiveSupport::TestCase

  test "Merchant validations" do
    m = Merchant.new
    m.save

    assert_equal ["can't be blank"], m.errors[:name]
    assert_equal ["can't be blank"], m.errors[:address]
    assert_equal 2, m.errors.count
  end

  test "create a  merchant" do
    m = Merchant.create(:name => "merchant", :address => "123 some street")

    assert_equal 0, m.errors.count
    assert_equal "merchant", m.name
    assert_equal "123 some street", m.address
  end

end
