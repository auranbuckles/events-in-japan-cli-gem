# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tokyo_events/version'

Gem::Specification.new do |spec|
  spec.name          = "tokyo-events"
  spec.version       = TokyoEvents::VERSION
  spec.authors       = ["Auran Buckles"]
  spec.summary       = %q{Current and upcoming events in Tokyo}
  spec.description   = %q{Provides information about current and upcoming events in Tokyo, including festivals, fashion shows, and food fairs.}
  spec.homepage      = "https://rubygems.org/gems/tokyo-events"
  spec.license       = "MIT"

  spec.files         = ["lib/tokyo_events.rb", "lib/tokyo_events/cli.rb", "lib/tokyo_events/scraper.rb", "lib/tokyo_events/event.rb"]
  spec.executables   << 'tokyo-events'

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
end
