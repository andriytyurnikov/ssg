require "test_helper"

class TranslationsControllerTest < ActionDispatch::IntegrationTest
  teardown do
    Rails.cache.clear
  end

  test "should pass parameters translate" do
    post translate_url(text: 'Hello, world', to: 'UK')

    assert_response :success
    assert_equal @response.body, {translation: 'Привіт, світе.'}.to_json
  end

end
