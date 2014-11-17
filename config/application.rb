require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kinoweb
  class Application < Rails::Application
    
  # Mindapp default
  config.generators do |g|
    g.orm             :mongoid
    g.template_engine :haml
    g.test_framework  :rspec
    g.integration_tool :rspec
  end
  # gmail config
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :user_name            => 'user@gmail.com',
    :password             => 'secret',
    :authentication       => 'plain',
    :enable_starttls_auto => true  }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true


  # First, you have to define and register your custom color theme. Each color
  # theme is mapped to a name.
  WebConsole::Colors.register_theme(:custom) do |c|
    # The most common color themes are the 16 colors one. They are built from 3
    # parts.

    # 8 darker colors.
    c.add '#000000'
    c.add '#cd0000'
    c.add '#00cd00'
    c.add '#cdcd00'
    c.add '#0000ee'
    c.add '#cd00cd'
    c.add '#00cdcd'
    c.add '#e5e5e5'

    # 8 lighter colors.
    c.add '#7f7f7f'
    c.add '#ff0000'
    c.add '#00ff00'
    c.add '#ffff00'
    c.add '#5c5cff'
    c.add '#ff00ff'
    c.add '#00ffff'
    c.add '#ffffff'

    # Background and foreground colors.
    c.background '#ffffff'
    c.foreground '#000000'
  end
  # Now you have to tell Web Console to actually use it.
    config.web_console.style.colors = :custom
    config.web_console.whitelisted_ips = %w( 127.0.0.1 79.105.12.242 )
    config.web_console.default_mount_path = '/debug'
    config.i18n.default_locale         = :ru
    config.generators.javascripts      false
    config.generators.stylesheets      false
    config.generators.test_framework   false
    config.generators.helper           false
    config.generators.assets           false
    config.generators.template_engine  :haml
    config.generators.orm              :active_record
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end

