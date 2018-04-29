require 'test_helper'

class VnasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vna = vnas(:one)
  end

  test "should get index" do
    get vnas_url
    assert_response :success
  end

  test "should get new" do
    get new_vna_url
    assert_response :success
  end

  test "should create vna" do
    assert_difference('Vna.count') do
      post vnas_url, params: { vna: { name: @vna.name } }
    end

    assert_redirected_to vna_url(Vna.last)
  end

  test "should show vna" do
    get vna_url(@vna)
    assert_response :success
  end

  test "should get edit" do
    get edit_vna_url(@vna)
    assert_response :success
  end

  test "should update vna" do
    patch vna_url(@vna), params: { vna: { name: @vna.name } }
    assert_redirected_to vna_url(@vna)
  end

  test "should destroy vna" do
    assert_difference('Vna.count', -1) do
      delete vna_url(@vna)
    end

    assert_redirected_to vnas_url
  end
end
