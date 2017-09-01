require 'test_helper'

class CountryClimatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @country_climate = country_climates(:one)
  end

  test "should get index" do
    get country_climates_url
    assert_response :success
  end

  test "should get new" do
    get new_country_climate_url
    assert_response :success
  end

  test "should create country_climate" do
    assert_difference('CountryClimate.count') do
      post country_climates_url, params: { country_climate: {  } }
    end

    assert_redirected_to country_climate_url(CountryClimate.last)
  end

  test "should show country_climate" do
    get country_climate_url(@country_climate)
    assert_response :success
  end

  test "should get edit" do
    get edit_country_climate_url(@country_climate)
    assert_response :success
  end

  test "should update country_climate" do
    patch country_climate_url(@country_climate), params: { country_climate: {  } }
    assert_redirected_to country_climate_url(@country_climate)
  end

  test "should destroy country_climate" do
    assert_difference('CountryClimate.count', -1) do
      delete country_climate_url(@country_climate)
    end

    assert_redirected_to country_climates_url
  end
end
