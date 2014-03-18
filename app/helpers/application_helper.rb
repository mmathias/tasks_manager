module ApplicationHelper
  def render_pending_tasks!
    content_for :tasks_stats do
      content_tag :p, t("task.pending_count", count: current_user.tasks.pending.count)
    end
  end
end
