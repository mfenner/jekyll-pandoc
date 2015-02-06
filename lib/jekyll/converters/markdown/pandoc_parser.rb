module Jekyll
  module Converters
    class Markdown
      class PandocParser

        DEFAULT_EXTENSIONS = []
        DEFAULT_FORMAT = 'html5'

        def initialize(config)
          require 'pandoc-ruby'
          @config = config
        rescue LoadError
          STDERR.puts 'You are missing a library required for Pandoc. Please run:'
          STDERR.puts ' $ [sudo] gem install pandoc-ruby'
          raise Errors::FatalException, "Missing dependency: pandoc-ruby"
        end

        def convert(content)
          extensions = config_option('extensions', DEFAULT_EXTENSIONS)
          format = config_option('format', DEFAULT_FORMAT)

          content = PandocRuby.new(content, *extensions).send("to_#{format}")
          raise Erros::FatalException, "Conversion returned empty string" unless content.length > 0
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
