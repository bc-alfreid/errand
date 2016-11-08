require 'test_helper'

class RunRequestsControllerTest < ActionController::TestCase
  setup do
    @run_request = run_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:run_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create run_request" do
    assert_difference('RunRequest.count') do
      post :create, run_request: { date_to: @run_request.date_to, location_from_adress_country: @run_request.location_from_adress_country, location_from_adress_line1: @run_request.location_from_adress_line1, location_from_adress_line2: @run_request.location_from_adress_line2, location_from_adress_state: @run_request.location_from_adress_state, location_from_city: @run_request.location_from_city, location_from_postcode: @run_request.location_from_postcode, location_to_adress_country: @run_request.location_to_adress_country, location_to_adress_line1: @run_request.location_to_adress_line1, location_to_adress_line2: @run_request.location_to_adress_line2, location_to_adress_state: @run_request.location_to_adress_state, location_to_city: @run_request.location_to_city, location_to_postcode: @run_request.location_to_postcode, user_id: @run_request.user_id }
    end

    assert_redirected_to run_request_path(assigns(:run_request))
  end

  test "should show run_request" do
    get :show, id: @run_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @run_request
    assert_response :success
  end

  test "should update run_request" do
    patch :update, id: @run_request, run_request: { date_to: @run_request.date_to, location_from_adress_country: @run_request.location_from_adress_country, location_from_adress_line1: @run_request.location_from_adress_line1, location_from_adress_line2: @run_request.location_from_adress_line2, location_from_adress_state: @run_request.location_from_adress_state, location_from_city: @run_request.location_from_city, location_from_postcode: @run_request.location_from_postcode, location_to_adress_country: @run_request.location_to_adress_country, location_to_adress_line1: @run_request.location_to_adress_line1, location_to_adress_line2: @run_request.location_to_adress_line2, location_to_adress_state: @run_request.location_to_adress_state, location_to_city: @run_request.location_to_city, location_to_postcode: @run_request.location_to_postcode, user_id: @run_request.user_id }
    assert_redirected_to run_request_path(assigns(:run_request))
  end

  test "should destroy run_request" do
    assert_difference('RunRequest.count', -1) do
      delete :destroy, id: @run_request
    end

    assert_redirected_to run_requests_path
  end
end
