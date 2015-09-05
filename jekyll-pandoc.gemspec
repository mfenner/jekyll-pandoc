# -*- encoding: utf-8 -*-
require File.expand_path("../lib/jekyll-pandoc/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'jekyll-pandoc'
  s.version     = JekyllPandoc::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Martin Fenner"]
  s.email       = 'martin.fenner@datacite.org'
  s.homepage    = 'https://github.com/mfenner/jekyll-pandoc'
  s.summary     = 'Jekyll Pandoc markdown converter'
  s.description = 'A Jekyll markdown converter that uses Pandoc (via the pandoc-ruby gem).'
  s.license     = 'MIT'

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "jekyll", ">=  1.4.3"
  s.add_dependency "pandoc-ruby", "~> 1.0.0"
  s.add_development_dependency 'rake'
  s.add_development_dependency "rspec", "~> 2.6"
  s.add_development_dependency "rdiscount", "~> 2.1.7"

  s.files       = Dir.glob("lib/**/*.rb")
end
