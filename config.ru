# config.ru
require_relative 'config/boot'
require 'roda'
require 'zeitwerk'

loader = Zeitwerk::Loader.new
# loader.logger = method(:puts)
loader.push_dir(__dir__)
loader.push_dir(__dir__ + '/lib')
loader.enable_reloading
loader.setup

if ENV['RACK_ENV'] == 'production'
  Zeitwerk::Loader.eager_load_all
  run App
else
  run ->(env) {
    loader.reload
    App.call(env)
  }
end
