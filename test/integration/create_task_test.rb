require 'test_helper'

class CreateTaskTest < ActionDispatch::IntegrationTest
  test "with valid data" do
    user = create(:user)
    login_as(user)

    visit root_path
    fill_in label("task.title"), with: "Some task"
    click_button create_button("task")

    assert_equal tasks_path, current_path
    assert_notice_message("tasks.create")
    assert page.has_content?("Some task")
  end

  test "with invalid data" do
    user = create(:user)
    login_as(user)

    visit root_path
    click_button create_button("task")

    error_messages = user.tasks.create.errors.full_messages.to_sentence

    assert_equal tasks_path, current_path
    assert_alert_message("tasks.create", messages: error_messages)

  end

  test "when unlogged" do
    visit tasks_path
    assert_equal login_path, current_path
  end
end
