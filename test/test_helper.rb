ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require "turn/reporter"

Dir[Rails.root.join("test/support/**/*.rb").to_s].each do |file|
  require file
end

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include FactoryGirl::Syntax::Methods
  include IntegrationHelpers
end

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
end
