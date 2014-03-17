require 'test_helper'

class LogoutTest < ActionDispatch::IntegrationTest
  test "when logged in" do
    user = create(:user)
    login_as(user)

    visit "/ "
    click_button t("buttons.logout")

    assert_equal login_path, current_path
  end

  test "when unlogged" do
    visit root_path
    assert_equal root_path, current_path
  end
end
