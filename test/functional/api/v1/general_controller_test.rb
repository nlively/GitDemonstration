require 'test_helper'

class Api::V1::GeneralControllerTest < ActionController::TestCase
  test "should get client_statuses" do
    get :client_statuses
    assert_response :success
  end

  test "should get daily_activities" do
    get :daily_activities
    assert_response :success
  end

end
