require "test_helper"

class ListTest < ActiveSupport::TestCase
  def setup
    @user = users(:tolase)
    @list = @user.lists.build(description: "Write some effing code")
  end

  test "list should be valid" do
    assert @list.valid?
  end

  test "user id must be present" do
    @list.user_id = nil
    assert_not @list.valid?
  end

  test "description must not be blank" do
    @list.description = "     "
    assert_not @list.valid?
  end

  test "description must not be more than 150 characters" do
    @list.description = "a" * 151
    assert_not @list.valid? 
  end

  test "order should be most recent first" do
    assert_equal lists(:oldest), List.first
  end
end
