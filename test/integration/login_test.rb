require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test "with valid credentials" do
    user = create(:user)
    login_as(user)

    assert_equal "/tasks", current_path
    assert page.has_content?(t("user.greeting", name: user.name))
  end

  test "with invalid credentials" do
    visit "/"
    click_link t("menu.login")
    click_button t("buttons.login")

    assert_equal "/login", current_path
    assert_alert_message "login.create"
  end

  test "when already logged in" do
    user = create(:user)
    login_as(user)

    visit "/login"
    assert_equal "/tasks", current_path
  end
end