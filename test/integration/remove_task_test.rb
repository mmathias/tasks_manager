require 'test_helper'

class RemoveTaskTest < ActionDispatch::IntegrationTest
  test "removes task" do
    user = create(:user)
    task = create(:task, user: user)
    login_as(user)

    click_link t("actions.remove")
    click_button t("buttons.remove_task")

    assert_notice_message "tasks.destroy"
    refute page.has_content?(task.title)
  end
end
