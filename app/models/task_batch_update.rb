class TaskBatchUpdate
  def self.update(user, task_ids)
    Task.transaction do
      mark_as_completed(user, task_ids)
      mark_all_as_pending(user, task_ids)
      mark_as_pending(user, task_ids)
    end
  end

  def self.mark_as_completed(user, task_ids)
    user.tasks
      .where(completed_at: nil, id: task_ids)
      .update_all(completed_at: Time.now)
  end

  def self.mark_all_as_pending(user, task_ids)
    user.tasks.update_all(completed_at: nil) if task_ids.blank?
  end

  def self.mark_as_pending(user, task_ids)
    user.tasks
      .where("id not in(?)", task_ids)
      .update_all(completed_at: nil) unless task_ids.blank?
  end
end
