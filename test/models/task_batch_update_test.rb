require 'test_helper'

class TaskBatchUpdateTest < ActiveSupport::TestCase

  test "mark tasks as completed" do
    user = create(:user)
    pending_task = create(:task, user: user)
    completed_task = create(:task, user: user, completed_at: Time.now)

    # Update pending tasks as completed
    TaskBatchUpdate.update(user, [pending_task.id])

    assert pending_task.reload.completed_at?
  end
  test "mark tasks as pending" do
    user = create(:user)
    pending_task = create(:task, user: user)
    completed_task = create(:task, user: user, completed_at: Time.now)

    # Update completed tasks as pending
    TaskBatchUpdate.update(user, [pending_task.id])

    refute completed_task.reload.completed_at?
  end
  test "mark all as pending" do
    user = create(:user)
    pending_task = create(:task, user: user)
    completed_task = create(:task, user: user, completed_at: Time.now)

    # Update all tasks as pending
    TaskBatchUpdate.update(user, nil)

    refute pending_task.reload.completed_at?
    refute completed_task.reload.completed_at?
  end
end
