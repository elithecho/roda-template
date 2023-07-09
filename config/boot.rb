# frozen_string_literal: true

require "rubygems"
require "bundler"

ENV["RACK_ENV"] ||= "development"

env = ENV.fetch("RACK_ENV", nil)
APP_ENV = env

Bundler.require(:default, env)

if %w[development test].include?(env)
  require "dotenv"

  Dotenv.load(".env", ".env.#{env}")
end
