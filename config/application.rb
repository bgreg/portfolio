require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Portfolio
  class Application < Rails::Application
    SecureHeaders::Configuration.default do |config|
	config.csp = {
		default_src: %w[self],
		script_src: %w[self unsafe-eval],
		connect_src: %w[self],
		style_src: %w[self unsafe-inline],
		img_src: %w[self],
	}
end

    config.generators do |g|
  g.javascript_engine :js
  g.test_framework :rspec, fixture: true
  g.fixture_replacement :factory_girl, dir: "spec/factories"
end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
