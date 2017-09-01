require 'test_helper'

class CityUniversitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @city_university = city_universities(:one)
  end

  test "should get index" do
    get city_universities_url
    assert_response :success
  end

  test "should get new" do
    get new_city_university_url
    assert_response :success
  end

  test "should create city_university" do
    assert_difference('CityUniversity.count') do
      post city_universities_url, params: { city_university: {  } }
    end

    assert_redirected_to city_university_url(CityUniversity.last)
  end

  test "should show city_university" do
    get city_university_url(@city_university)
    assert_response :success
  end

  test "should get edit" do
    get edit_city_university_url(@city_university)
    assert_response :success
  end

  test "should update city_university" do
    patch city_university_url(@city_university), params: { city_university: {  } }
    assert_redirected_to city_university_url(@city_university)
  end

  test "should destroy city_university" do
    assert_difference('CityUniversity.count', -1) do
      delete city_university_url(@city_university)
    end

    assert_redirected_to city_universities_url
  end
end
