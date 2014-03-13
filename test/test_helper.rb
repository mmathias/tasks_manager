ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

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

  def assert_notice_message(scope)
    assert page.has_content?(t("flash.#{scope}.notice"))
  end
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
  include IntegrationHelpers
end

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
