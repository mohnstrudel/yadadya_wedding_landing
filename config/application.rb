require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WeddingLanding
  class Application < Rails::Application
    config.autoload_paths << config.root.join("app", "cables")
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.page_size = 20

    config.active_job.queue_adapter = :delayed_job

    config.organizer_logo_css = ["Вытянутый в ширину (слово, например)", "Вытянутый в высоту", "Симметричный"]

    config.request_statuses = {'Одобрение' => 'approved', 'Отказ' => 'declined', 'На рассмотрении' => 'pending'}

    config.action_mailer.preview_path = "#{Rails.root}/test/mailers/previews"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
