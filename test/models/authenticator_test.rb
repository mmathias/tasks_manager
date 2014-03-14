require "test_helper"

class AuthenticatorTest < ActiveSupport::TestCase
  setup do
    @user = create(:user)
  end

  teardown do
  end

  test "authenticates user by email" do
    authenticated = Authenticator.authenticate(@user.email, "test")
    assert_equal @user, authenticated
  end

  test "authenticates user by login" do
    authenticated = Authenticator.authenticate(@user.login, "test")
    assert_equal @user, authenticated
  end

  test "rejects invalid credential" do
    refute Authenticator.authenticate("wrong@example.com", "test")
  end

  test "rejects invalid password" do
    refute Authenticator.authenticate(@user.email, "wrong_pass")
  end
end
