require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  
  def setup
    @user =users(:uemura)
    @micropost = @user.microposts.build(time: 1)
  end
  
  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end
  
  test "timw should be present" do
    @micropost.time = "   "
    assert_not @micropost.valid?
  end

  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end
  
  
end
