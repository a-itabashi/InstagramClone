require 'test_helper'

class HerokuControllerTest < ActionDispatch::IntegrationTest
  test "should get config:get" do
    get heroku_config:get_url
    assert_response :success
  end

  test "should get SENDGRID-USERNAME" do
    get heroku_SENDGRID-USERNAME_url
    assert_response :success
  end

end
