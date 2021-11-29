require 'test_helper'

class InterventionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get interventions_show_url
    assert_response :success
  end

end
