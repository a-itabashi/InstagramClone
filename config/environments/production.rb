Rails.application.configure do
  config.cache_classes = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.read_encrypted_secrets = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.assets.compile = true
  config.log_level = :debug
  config.log_tags = [ :request_id ]
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end
  config.active_record.dump_schema_after_migration = false

  # config.action_mailer.default_url_options = { host: 'desolate-peak-43756.herokuapp.com' }
  # ActionMailer::Base.delivery_method = :smtp
  # ActionMailer::Base.smtp_settings = {
  #   user_name: ENV['SENDGRID_USERNAME'],
  #   password: ENV['SENDGRID_PASSWORD'],
  #   domain: "heroku.com",
  #   address: "smtp.SendGrid.net",
  #   port: 587,
  #   authentication: :plain,
  #   enable_starttls_auto: true
  # }

  config.action_mailer.default_url_options = { host: 'desolate-peak-43756.herokuapp.com'}
  config.action_mailer.delivery_method = :letter_opener_web
end
