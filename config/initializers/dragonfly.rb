require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "bc9d0d3025b4c50f9f26be7a745f7aa51f2d21aa0b9fc6110bb7e461d703c05f"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
