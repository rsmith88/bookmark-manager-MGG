ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'MyApp.rb')
require_relative './setup_test_database'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'pg'

ENV['ENVIRONMENT'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end


Capybara.app = MyApp
