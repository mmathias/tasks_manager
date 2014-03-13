require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "requires name" do
    user = User.create(name: nil)
    assert user.errors[:name].any?
  end

  test "requires email" do
    user = User.create(email:nil)
    assert user.errors[:email].any?
  end

  test "requires valid email" do
    user = User.create(email: "invalid")
    assert user.errors[:email].any?
  end

  %w[
    john@example.org
    john@example.me
    john@example.info
    john.doe@example.org
    john.doe+spam@example.org
    john@example.com.br
    john@example.co.uk
    john@example-domain.com
  ].each do |email|
    test "accepts #{email}" do
      user = User.create(email: email)
      assert user.errors[:email].empty?
    end
  end

  test "requires password" do
    user = User.create(password:nil)
    assert user.errors[:password].any?
  end

  test "requires password confirmation" do
    user = User.create(password:'bla', password_confirmation:'blabla')
    assert user.errors[:password_confirmation].any?
  end

end
