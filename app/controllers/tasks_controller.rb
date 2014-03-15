class TasksController < ApplicationController
  before_action :require_logged_user

  def index
    @task = Task.new
    @tasks = current_user.tasks
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      flash.notice = t("flash.tasks.create.notice")
    else
      messages = @task.errors.full_messages.to_sentence
      flash.alert = t("flash.tasks.create.alert", messages: messages)
    end
    redirect_to "/tasks"

  end

  private
  def task_params
    params
      .require(:task)
      .permit(:title)
  end
end
