require 'test_helper'

class EditTaskTest < ActionDispatch::IntegrationTest
  test "with valid data" do
    user = create(:user)
    task = create(:task, user: user)
    login_as(user)

    visit tasks_path
    click_link t("actions.edit")

    fill_in label("task.title"), with: "UPDATED"
    click_button update_button("task")

    assert_equal tasks_path, current_path
    assert_notice_message "tasks.update"
    assert page.has_content?("UPDATED")
  end

  test "with invalid data" do
    user = create(:user)
    task = create(:task, user: user)
    login_as(user)

    visit tasks_path
    click_link t("actions.edit")

    fill_in label("task.title"), with: ""
    click_button update_button("task")

    assert_equal edit_task_path(task), current_path
    #assert_alert_message "tasks.update"
    assert_form_error_message
  end

  test "when unlogged" do
    visit edit_task_path(1)
    assert_equal login_path, current_path
  end
end
