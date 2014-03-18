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
  test "returns pending tasks" do
    user = create(:user)
    pending_task = create(:task, user: user)
    completed_task = create(:task, user: user, completed_at: Time.now)

    assert_equal [pending_task], user.tasks.pending.to_a
  end
  test "sorts pending tasks first" do
    user = create(:user)
    completed_task = create(:task, user: user, completed_at: Time.now)
    pending_task = create(:task, user: user)

    assert_equal [pending_task, completed_task], user.tasks.pending_first.to_a
  end
end
