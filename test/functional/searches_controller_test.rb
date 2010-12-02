require 'test_helper'

class SearchesControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "should get index" do
    get :index, :format => :xml
    assert_response :success
    
    assert_select "string", "All"
  end
end
