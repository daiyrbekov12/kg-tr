require 'test_helper'

class DictionaryControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get dictionary_about_url
    assert_response :success
  end

  test "should get help" do
    get dictionary_help_url
    assert_response :success
  end

  test "should get contact" do
    get dictionary_contact_url
    assert_response :success
  end

end
