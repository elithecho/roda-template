# frozen_string_literal: true

require "dry/system/container"
require "dry/system/loader/autoloading"

class Application < Dry::System::Container
  use :env, inferrer: -> { ENV.fetch("RACK_ENV", "development").to_sym }
  use :zeitwerk

  configure do |config|
    config.root = File.expand_path("..", __dir__)
    config.component_dirs.add "lib"

    if config.env == :development
      config.autoloader.enable_reloading
    end

    # config.autoloader.collapse("#{config.root}/**/some_path")
  end
end
