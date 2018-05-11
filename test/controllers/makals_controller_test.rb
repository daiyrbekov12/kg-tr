require 'test_helper'

class MakalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @makal = makals(:one)
  end

  test "should get index" do
    get makals_url
    assert_response :success
  end

  test "should get new" do
    get new_makal_url
    assert_response :success
  end

  test "should create makal" do
    assert_difference('Makal.count') do
      post makals_url, params: { makal: { description: @makal.description, kg: @makal.kg, tr: @makal.tr } }
    end

    assert_redirected_to makal_url(Makal.last)
  end

  test "should show makal" do
    get makal_url(@makal)
    assert_response :success
  end

  test "should get edit" do
    get edit_makal_url(@makal)
    assert_response :success
  end

  test "should update makal" do
    patch makal_url(@makal), params: { makal: { description: @makal.description, kg: @makal.kg, tr: @makal.tr } }
    assert_redirected_to makal_url(@makal)
  end

  test "should destroy makal" do
    assert_difference('Makal.count', -1) do
      delete makal_url(@makal)
    end

    assert_redirected_to makals_url
  end
end
