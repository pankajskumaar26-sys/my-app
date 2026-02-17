require "test_helper"

class GirlsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get girls_index_url
    assert_response :success
  end

  test "should get show" do
    get girls_show_url
    assert_response :success
  end

  test "should get new" do
    get girls_new_url
    assert_response :success
  end

  test "should get edit" do
    get girls_edit_url
    assert_response :success
  end
end
