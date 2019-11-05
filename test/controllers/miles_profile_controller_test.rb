require 'test_helper'

class MilesProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get programme" do
    get miles_profile_programme_url
    assert_response :success
  end

  test "should get amount:integer" do
    get miles_profile_amount:integer_url
    assert_response :success
  end

  test "should get price:integer" do
    get miles_profile_price:integer_url
    assert_response :success
  end

  test "should get user:references" do
    get miles_profile_user:references_url
    assert_response :success
  end

end
