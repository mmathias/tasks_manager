require "test_helper"

class SignupTest < ActionDispatch::IntegrationTest
  test "sign up with valid data" do
  	visit "/"
  	click_link t("menu.signup")

    fill_in label("user.name"), with: "John Doe"
    fill_in label("user.email"), with: "johndoe@example.org"
    fill_in label("user.login"), with: "johndoe"
    fill_in label("user.password"), with: "test"
    fill_in label("user.password_confirmation"), with: "test"

    click_button create_button("user")

    assert_equal login_path, current_path
    assert_notice_message("signup.create")
  end

  test "sign up with invalid data" do
    visit "/"
    click_link t("menu.signup")
    click_button create_button("user")

    assert_equal signup_path, current_path

    assert_form_error_message
  end
end
