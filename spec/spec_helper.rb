require 'bundler/setup'
Bundler.setup

require 'pandoc-ruby'
require 'jekyll'
require File.expand_path("../../lib/jekyll/converters/markdown.rb", __FILE__)
require 'jekyll/converters/markdown/pandoc_parser'