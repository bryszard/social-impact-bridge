require "test_helper"

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get search_url
    assert_response :success
  end

  test "should get result" do
    get result_url
    assert_response :success
  end
end
