require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LiteMan
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
    # config.action_controller.permit_all_parameters = true
    config.exceptions_app = ->(env) do
      ErrorsController.action(:show).call(env)
    end
    config.generators.test_framework      = :rspec
    config.generators.system_tests        = false
    config.generators.stylesheets         = false
    config.generators.javascripts         = false
    config.generators.helper              = false
    config.generators.helper_specs        = false
    config.generators.view_specs          = false
  end
end
