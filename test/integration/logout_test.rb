require 'test_helper'

class LogoutTest < ActionDispatch::IntegrationTest
  test "when logged in" do
    user = create(:user)
    login_as(user)

    visit "/ "
    click_button t("buttons.logout")

    assert_equal "/login", current_path
  end

  test "when unlogged" do
    visit "/"
    assert_equal "/", current_path
  end
end
