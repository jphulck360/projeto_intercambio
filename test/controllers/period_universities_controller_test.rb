require 'test_helper'

class PeriodUniversitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @period_university = period_universities(:one)
  end

  test "should get index" do
    get period_universities_url
    assert_response :success
  end

  test "should get new" do
    get new_period_university_url
    assert_response :success
  end

  test "should create period_university" do
    assert_difference('PeriodUniversity.count') do
      post period_universities_url, params: { period_university: {  } }
    end

    assert_redirected_to period_university_url(PeriodUniversity.last)
  end

  test "should show period_university" do
    get period_university_url(@period_university)
    assert_response :success
  end

  test "should get edit" do
    get edit_period_university_url(@period_university)
    assert_response :success
  end

  test "should update period_university" do
    patch period_university_url(@period_university), params: { period_university: {  } }
    assert_redirected_to period_university_url(@period_university)
  end

  test "should destroy period_university" do
    assert_difference('PeriodUniversity.count', -1) do
      delete period_university_url(@period_university)
    end

    assert_redirected_to period_universities_url
  end
end
