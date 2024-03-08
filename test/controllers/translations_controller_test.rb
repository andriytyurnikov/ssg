require "test_helper"

class TranslationsControllerTest < ActionDispatch::IntegrationTest

  test "should pass parameters translate" do
    get translate_url(text: 'Hi', to: 'UK')
    assert_response :success
  end

end
