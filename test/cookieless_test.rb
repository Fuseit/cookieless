require 'test_helper'

describe Rack::Cookieless do
  include Rack::Test::Methods

  let(:inner_app) do
    lambda { |env| [200, env, 'app'] }
  end

  let(:app) do
    Rack::Cookieless.new(inner_app)
  end

  it 'is good' do
    get '/'
    assert last_response.ok?
  end
end