# frozen_string_literal: true

require_relative "boot"

require "dry/system/container"
require "dry/system/loader/autoloading"

class Application < Dry::System::Container
  use :env, inferrer: -> { ENV.fetch("RACK_ENV", "development") }
  use :zeitwerk

  configure do |config|
    config.root = File.expand_path("..", __dir__)

    config.component_dirs.add "lib"
    # config.autoloader.collapse("#{config.root}/**/some_path")
  end
end
end

Import = Dry::AutoInject(Application)

module Types
  include Dry.Types()
end
