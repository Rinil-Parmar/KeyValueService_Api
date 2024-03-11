require "test_helper"

class KeysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @key = keys(:one)
  end

  test "should get index" do
    get keys_url, as: :json
    assert_response :success
  end

  test "should create key" do
    assert_difference("Key.count") do
      post keys_url, params: { key: { key: @key.key, value: @key.value } }, as: :json
    end

    assert_response :created
  end

  test "should show key" do
    get key_url(@key), as: :json
    assert_response :success
  end

  test "should update key" do
    patch key_url(@key), params: { key: { key: @key.key, value: @key.value } }, as: :json
    assert_response :success
  end

  test "should destroy key" do
    assert_difference("Key.count", -1) do
      delete key_url(@key), as: :json
    end

    assert_response :no_content
  end
end
