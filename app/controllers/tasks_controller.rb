class TasksController < ApplicationController
  before_action :require_logged_user

  # index => /tasks
  # new => /tasks/new
  # create => POST /tasks (REST)
  # create => POST /tasks/new (minha preferencia)
  # edit => GET /tasks/:id/edit
  # update => PATCH /tasks/:id (REST)
  # update => PATCH /tasks/:id/edit (minha preferencia)
  # destroy => DELETE /tasks/:id

  def index
    @task = Task.new
    @tasks = current_user.tasks.pending_first
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      flash.notice = t("flash.tasks.create.notice")
    else
      messages = @task.errors.full_messages.to_sentence
      flash.alert = t("flash.tasks.create.alert", messages: messages)
    end
    redirect_to tasks_path

  end

  def edit
    @task = find_task
  end

  def update
    @task = find_task
    if @task.update(task_params)
      flash.notice = t("flash.tasks.update.notice")
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task = find_task
    @task.destroy!

    flash.notice = t("flash.tasks.destroy.notice")
    redirect_to tasks_path
  end

  def remove
    @task = find_task
  end

  def batch_update
    TaskBatchUpdate.update(current_user, params[:task_ids])
    redirect_to tasks_path
  end

  private
  def task_params
    params
      .require(:task)
      .permit(:title)
  end

  def find_task
    current_user.tasks.find(params[:id])
  end
end
