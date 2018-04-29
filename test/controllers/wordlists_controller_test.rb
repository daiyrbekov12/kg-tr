require 'test_helper'

class WordlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wordlist = wordlists(:one)
  end

  test "should get index" do
    get wordlists_url
    assert_response :success
  end

  test "should get new" do
    get new_wordlist_url
    assert_response :success
  end

  test "should create wordlist" do
    assert_difference('Wordlist.count') do
      post wordlists_url, params: { wordlist: { name: @wordlist.name, user_id: @wordlist.user_id } }
    end

    assert_redirected_to wordlist_url(Wordlist.last)
  end

  test "should show wordlist" do
    get wordlist_url(@wordlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_wordlist_url(@wordlist)
    assert_response :success
  end

  test "should update wordlist" do
    patch wordlist_url(@wordlist), params: { wordlist: { name: @wordlist.name, user_id: @wordlist.user_id } }
    assert_redirected_to wordlist_url(@wordlist)
  end

  test "should destroy wordlist" do
    assert_difference('Wordlist.count', -1) do
      delete wordlist_url(@wordlist)
    end

    assert_redirected_to wordlists_url
  end
end
