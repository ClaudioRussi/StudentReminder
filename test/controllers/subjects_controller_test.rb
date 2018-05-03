require 'test_helper'

class SubjectsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  #User Logged in
  test "should GET index with user logged in" do
    sign_in users(:user1)
    get subjects_url
    assert_response :success
  end

  test "should GET new with user logged in" do
    sign_in users(:user1)
    get new_subject_url
    assert_response :success
  end

  test "should GET edit with author logged in" do
    sign_in users(:user1)
    get edit_subject_url(subjects(:subject1))
    assert_response :success
  end

  test "should not GET edit with random user logged in" do
    sign_in users(:user2)
    get edit_subject_url(subjects(:subject1))
    assert_redirected_to root_url
  end

  test "should create subject with user logged in " do
    sign_in users(:user1)
    assert_difference("Subject.count", 1) do
      post subjects_url, params:{ subject:{description: "Short description for sujbect", name:"Subject name"}}
    end
    assert_redirected_to subject_path(Subject.last)
  end

  test "should update subject with author logged in" do
    sign_in users(:user1)
    patch subject_url(subjects(:subject1)), params:{subject:{description: "Description should be updated"}}
    assert_not subjects(:subject1).description, "Description should be updated"
    assert_redirected_to subject_path(subjects(:subject1))
  end

  test "should not update subject with random user logged in" do
    sign_in users(:user2)
    patch subject_url(subjects(:subject1)), params:{subject:{description: "Description should not be updated"}}
    assert_not subjects(:subject1).description, "Description should not be updated"
    assert_redirected_to root_url
  end

  test "should delete subject with author logged in" do
    sign_in users(:user1)
    assert_difference("Subject.count", -1) do
      delete subject_url(subjects(:subject1))
    end
    assert_redirected_to subjects_path
  end

  test "should not delete subject with random user logged in" do
    sign_in users(:user2)
    assert_no_difference("Subject.count") do
      delete subject_url(subjects(:subject1))
    end
    assert_redirected_to root_url
  end

  #User not logged in
  test "should not GET index without logged in user" do
    get subjects_url
    assert_redirected_to root_url
  end

  test "should not GET new without logged in user" do
    get new_subject_url
    assert_redirected_to root_url
  end

  test "should not create subject without logged in user" do
    assert_no_difference("Subject.count") do
      post subjects_url, params:{ subject:{description: "Short description for sujbect", name:"Subject name"}}
    end
    assert_redirected_to root_url
  end

  test "should not update subject without logged in user" do
    patch subject_url(subjects(:subject1)), params:{subject:{description: "Description should not be updated"}}
    assert_not subjects(:subject1).description, "Description should not be updated"
    assert_redirected_to root_url
  end

  test "should not delte subject without logged in user" do
    assert_no_difference("Subject.count") do
      delete subject_url(subjects(:subject1))
    end
    assert_redirected_to root_url
  end


end
