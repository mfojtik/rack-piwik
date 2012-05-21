require 'sinatra/base'
require 'rack/piwik'

class TestPiwik < Sinatra::Base

  use Rack::Piwik.tracking(:url => 'http://stats.mifo.sk', :site_id => 1, :no_javascript => false)

  get '/' do
    "<html><head></head><body>Hello world!</body></html>"
  end

end

TestPiwik.run!
