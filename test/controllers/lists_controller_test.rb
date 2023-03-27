require "test_helper"

class ListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @list = lists(:orange)   
  end

  test "should redirect index when not logged in" do
    get lists_path
    assert_redirected_to new_user_session_url
  end

  test "should redirect new when not logged in" do
    get new_list_path
    assert_redirected_to new_user_session_url
  end

  test "should redirect edit when not logged in" do
    get edit_list_path(@list)
    assert_redirected_to new_user_session_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'List.count' do
        delete list_path(@list)
    end
    assert_response :see_other
    assert_redirected_to new_user_session_url
  end

end
