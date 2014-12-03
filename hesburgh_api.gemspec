$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "hesburgh_api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "hesburgh_api"
  s.version     = HesburghApi::VERSION
  s.authors     = ["Jon Hartzler"]
  s.email       = ["jhartzler@nd.edu"]
  s.homepage    = "http://library.nd.edu"
  s.summary     = "Models for connecting to the Hesburgh API server"
  s.description = "Models for connecting to the Hesburgh API server"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE.txt", "Rakefile", "README.md"]

  s.test_files = Dir["spec/**/*"]


  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "faraday"
  s.add_dependency "faraday_middleware"
  s.add_dependency "excon"
  s.add_dependency "typhoeus"
  s.add_dependency "multi_xml"

  s.add_development_dependency 'rspec-rails', '2.14.0'
  s.add_development_dependency 'guard', '< 2.8'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-coffeescript'
  s.add_development_dependency 'guard-rails'
  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'guard-spork'
  s.add_development_dependency 'growl'
  s.add_development_dependency 'rb-readline'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'

end
