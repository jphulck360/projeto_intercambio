require 'test_helper'

class CourseUniversitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_university = course_universities(:one)
  end

  test "should get index" do
    get course_universities_url
    assert_response :success
  end

  test "should get new" do
    get new_course_university_url
    assert_response :success
  end

  test "should create course_university" do
    assert_difference('CourseUniversity.count') do
      post course_universities_url, params: { course_university: {  } }
    end

    assert_redirected_to course_university_url(CourseUniversity.last)
  end

  test "should show course_university" do
    get course_university_url(@course_university)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_university_url(@course_university)
    assert_response :success
  end

  test "should update course_university" do
    patch course_university_url(@course_university), params: { course_university: {  } }
    assert_redirected_to course_university_url(@course_university)
  end

  test "should destroy course_university" do
    assert_difference('CourseUniversity.count', -1) do
      delete course_university_url(@course_university)
    end

    assert_redirected_to course_universities_url
  end
end
