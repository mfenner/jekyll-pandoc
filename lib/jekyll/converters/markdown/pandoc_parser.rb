module Jekyll
  module Converters
    class Markdown
      class PandocParser

        def initialize(config)
          require 'pandoc-ruby'
          @config = config
        rescue LoadError
          STDERR.puts 'You are missing a library required for Pandoc. Please run:'
          STDERR.puts ' $ [sudo] gem install pandoc-ruby'
          raise FatalException, "Missing dependency: pandoc-ruby"
        end

        def convert(content)
          extensions = config_option('extensions', [])
          format = config_option('format', 'html5')

          content = PandocRuby.new(content, *extensions).send("to_#{format}")
          raise FatalException, "Conversion returned empty string" unless content.length > 0
          content
        end

        def config_option(key, default=nil)
          if @config['pandoc']
            @config['pandoc'].fetch(key, default)
          else
            default
          end
        end

      end
    end
  end
end