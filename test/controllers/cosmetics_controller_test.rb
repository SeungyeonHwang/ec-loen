require 'test_helper'

class CosmeticsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cosmetics_index_url
    assert_response :success
  end

  test "should get show" do
    get cosmetics_show_url
    assert_response :success
  end

end
