require 'test_helper'

class CountryContinentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @country_continent = country_continents(:one)
  end

  test "should get index" do
    get country_continents_url
    assert_response :success
  end

  test "should get new" do
    get new_country_continent_url
    assert_response :success
  end

  test "should create country_continent" do
    assert_difference('CountryContinent.count') do
      post country_continents_url, params: { country_continent: {  } }
    end

    assert_redirected_to country_continent_url(CountryContinent.last)
  end

  test "should show country_continent" do
    get country_continent_url(@country_continent)
    assert_response :success
  end

  test "should get edit" do
    get edit_country_continent_url(@country_continent)
    assert_response :success
  end

  test "should update country_continent" do
    patch country_continent_url(@country_continent), params: { country_continent: {  } }
    assert_redirected_to country_continent_url(@country_continent)
  end

  test "should destroy country_continent" do
    assert_difference('CountryContinent.count', -1) do
      delete country_continent_url(@country_continent)
    end

    assert_redirected_to country_continents_url
  end
end
