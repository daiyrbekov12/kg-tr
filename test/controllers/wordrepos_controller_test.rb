require 'test_helper'

class WordreposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wordrepo = wordrepos(:one)
  end

  test "should get index" do
    get wordrepos_url
    assert_response :success
  end

  test "should get new" do
    get new_wordrepo_url
    assert_response :success
  end

  test "should create wordrepo" do
    assert_difference('Wordrepo.count') do
      post wordrepos_url, params: { wordrepo: { word_id: @wordrepo.word_id, wordlist_id: @wordrepo.wordlist_id } }
    end

    assert_redirected_to wordrepo_url(Wordrepo.last)
  end

  test "should show wordrepo" do
    get wordrepo_url(@wordrepo)
    assert_response :success
  end

  test "should get edit" do
    get edit_wordrepo_url(@wordrepo)
    assert_response :success
  end

  test "should update wordrepo" do
    patch wordrepo_url(@wordrepo), params: { wordrepo: { word_id: @wordrepo.word_id, wordlist_id: @wordrepo.wordlist_id } }
    assert_redirected_to wordrepo_url(@wordrepo)
  end

  test "should destroy wordrepo" do
    assert_difference('Wordrepo.count', -1) do
      delete wordrepo_url(@wordrepo)
    end

    assert_redirected_to wordrepos_url
  end
end
