module Jekyll
  module Converters
    class Markdown::Pandoc
      DEFAULT_EXTENSIONS = []
      DEFAULT_FORMAT = 'html5'

      def initialize(config)
        Jekyll::External.require_with_graceful_fail "pandoc-ruby"

        @config = config
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
          @config.fetch('pandoc', {}).fetch(key, default)
        else
          default
        end
      end

    end
  end
end
