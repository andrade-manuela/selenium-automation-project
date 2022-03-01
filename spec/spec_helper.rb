require 'rubygems'
require 'bundler/setup'
require 'capybara/dsl'
require 'capybara/rspec'

Bundler.require

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.javascript_driver = :selenium_chrome
Capybara.default_driver = :selenium_chrome
Capybara.default_max_wait_time = 10

Capybara.configure do |config|
  config.app_host = 'https://www.phptravels.net' # URL base que vamos utilizar
end

RSpec.configure do |config|
  config.formatter = :documentation
end