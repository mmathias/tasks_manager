module IntegrationHelpers
  def t(*args)
    I18n.t(*args)
  end

  def label(scope)
    t(scope, scope: "labels")
  end

  def create_button(model)
    t("helpers.submit.#{model}.create")
  end

  def assert_form_error_message
    assert page.has_content?(t("form.error_message"))
  end

  def assert_notice_message(scope, options = {})
    assert page.has_content?(t("flash.#{scope}.notice", options))
  end

  def assert_alert_message(scope, options = {})
    assert page.has_content?(t("flash.#{scope}.alert", options))
  end

  def login_as(user)
    visit root_path
    click_link t("menu.login")

    fill_in label("login.credential"), with: user.email
    fill_in label("login.password"), with: user.password
    click_button t("buttons.login")
  end
end
