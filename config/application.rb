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
    config.middleware.use Rack::Attack
    config.exceptions_app = ->(env) do
      ErrorsController.action(:show).call(env)
    end
    config.generators do |g|
      g.test_framework :rspec,
        view_specs: false,
        helper_specs: false,
        routing_specs: false
    end
  end
end
