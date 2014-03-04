require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'

require 'cookieless'

ENV['RACK_ENV'] = 'test'
ENV['RAILS_ENV'] = 'test'

require 'rails'
case Rails::VERSION::MAJOR
when 4
  require 'dummy/rails4'
when 3
  require 'dummy/rails3'
end
