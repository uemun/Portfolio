require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:uemura)
  end
  
  test "micropost interface" do
    log_in_as(@user)
    get user_path(@user)
    #無効な送信
    time = 100
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { time: time} }
    end
    #　有効な送信
    time = 5
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params: { micropost: { time: time} }
    end
    assert_redirected_to user_path(@user)
    #投稿削除 
    first_micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
  end
end  