require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "requires title" do
    task = Task.create(title: nil)
    assert task.errors[:title].any?
  end
  test "requires user" do
    task = Task.create(user: nil)
    assert task.errors[:user].any?
  end
  test "detect task as completed" do
    task = Task.create(completed_at: Time.now)
    assert_equal "completed", task.status
  end
  test "detect task as pending" do
    task = Task.create(completed_at: nil)
    assert_equal "pending", task.status
  end
end
