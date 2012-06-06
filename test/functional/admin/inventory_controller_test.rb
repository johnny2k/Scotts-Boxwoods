require 'test_helper'

class Admin::InventoryControllerTest < ActionController::TestCase
  test "should get add_product" do
    get :add_product
    assert_response :success
  end

  test "should get remove_product" do
    get :remove_product
    assert_response :success
  end

end
