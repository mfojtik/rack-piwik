require 'rake'

Gem::Specification.new do |s|
  s.author = 'Michal Fojtik'
  s.homepage = "http://github.com/mifo/rack-piwik"
  s.email = 'mi@mifo.sk'
  s.name = 'rack-piwik'
  s.require_path = 'lib'
  s.platform    = Gem::Platform::RUBY

  s.description = <<-EOF
    Rack-Piwik is a Rack middleware that you can use to easely
    install the Piwik (http://piwik.org/) tracking code to your
    Sinatra or Rails application.
  EOF

  s.version = '1.0.0'
  s.date = Time.now
  s.summary = %q{Rack middleware for Piwik web analytics}
  s.files = FileList[
    'lib/rack/piwik.rb',
    'LICENSE',
    'README.md',
    'rack-piwik.gemspec',
  ].to_a

  s.extra_rdoc_files = Dir["LICENSE"]
  s.required_ruby_version = '>= 1.8.1'
  s.add_runtime_dependency 'rack', '>= 1.3.0'
end
