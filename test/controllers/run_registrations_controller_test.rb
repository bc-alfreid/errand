require 'test_helper'

class RunRegistrationsControllerTest < ActionController::TestCase
  setup do
    @run_registration = run_registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:run_registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create run_registration" do
    assert_difference('RunRegistration.count') do
      post :create, run_registration: { date_from: @run_registration.date_from, date_to: @run_registration.date_to, location_from_adress_country: @run_registration.location_from_adress_country, location_from_adress_line1: @run_registration.location_from_adress_line1, location_from_adress_line2: @run_registration.location_from_adress_line2, location_from_adress_state: @run_registration.location_from_adress_state, location_from_city: @run_registration.location_from_city, location_from_postcode: @run_registration.location_from_postcode, location_to_adress_country: @run_registration.location_to_adress_country, location_to_adress_line1: @run_registration.location_to_adress_line1, location_to_adress_line2: @run_registration.location_to_adress_line2, location_to_adress_state: @run_registration.location_to_adress_state, location_to_city: @run_registration.location_to_city, location_to_postcode: @run_registration.location_to_postcode }
    end

    assert_redirected_to run_registration_path(assigns(:run_registration))
  end

  test "should show run_registration" do
    get :show, id: @run_registration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @run_registration
    assert_response :success
  end

  test "should update run_registration" do
    patch :update, id: @run_registration, run_registration: { date_from: @run_registration.date_from, date_to: @run_registration.date_to, location_from_adress_country: @run_registration.location_from_adress_country, location_from_adress_line1: @run_registration.location_from_adress_line1, location_from_adress_line2: @run_registration.location_from_adress_line2, location_from_adress_state: @run_registration.location_from_adress_state, location_from_city: @run_registration.location_from_city, location_from_postcode: @run_registration.location_from_postcode, location_to_adress_country: @run_registration.location_to_adress_country, location_to_adress_line1: @run_registration.location_to_adress_line1, location_to_adress_line2: @run_registration.location_to_adress_line2, location_to_adress_state: @run_registration.location_to_adress_state, location_to_city: @run_registration.location_to_city, location_to_postcode: @run_registration.location_to_postcode }
    assert_redirected_to run_registration_path(assigns(:run_registration))
  end

  test "should destroy run_registration" do
    assert_difference('RunRegistration.count', -1) do
      delete :destroy, id: @run_registration
    end

    assert_redirected_to run_registrations_path
  end
end
