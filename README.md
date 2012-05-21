Rack::Piwik
==============

Rack::Piwik makes the installation of [Piwik](http://piwik.org/) tracking code
easy. Rack::Piwik will install the tracking code to all HTML responses of your
Rack based application (Rails, Padrino, Sinatra, etc...).

Installation
==============

For the [Sinatra](http://sinatrarb.com) you need to write this:

    require 'sinatra/base'
    require 'rack/piwik'

    class MyApplication < Sinatra::Base

      use Rack::Piwik.tracking(:url => "http://stats.yourpiwiksite.com", :site_id => 1)

    end

For Ruby on Rails you should do following:

    # config.ru

    use Rack::Piwik.tracking(:url => "http://stats.yourpiwiksite.com", :site_id => 1)

Or optionally you can do this:

    # application.rb

    class Application < Rails::Application

      config.middleware.use Rack::Piwik.tracking(:url => "http://stats.yourpiwiksite.com", :site_id => 1)

      # ...
    end

In case you want to use just static image instead of the Javascript code,
you can add the <code>:no_javascript</code> option to <code>tracking</code>
method.

License
==============

Copyright (c) 2012 Michal Fojtik <http://mifo.sk>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to
deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
