require 'test_helper'

# WelcomeControllerTestクラスは、WelcomeControllerの統合テストを行うためのクラスです。
class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get welcome_index_url
    assert_response :success
  end
end
