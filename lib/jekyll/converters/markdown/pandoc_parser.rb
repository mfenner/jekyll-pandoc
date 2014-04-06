# monkey patch Jekyll Markdown setup method for compatibility
module Jekyll
  module Converters
    class Markdown

      PARSERS = { 'redcarpet' => RedcarpetParser,
                  'kramdown' => KramdownParser,
                  'rdiscount' => RDiscountParser,
                  'maruku' => MarukuParser }

      def setup
        return if @setup
        @parser = parser(@config['markdown']).new(@config)
        @setup = true
      rescue NameError
        Jekyll.logger.error "Invalid Markdown Processor:", "#{@config['markdown']}"
        Jekyll.logger.error "", "Valid options are [ #{PARSERS.keys.join(" | ")} ]"
        raise Jekyll::FatalException, "Invalid Markdown Processor: #{@config['markdown']}"
      end

      private

      def parser(name)
        if PARSERS.keys.include?(name.downcase)
          PARSERS[name.downcase]
        elsif name =~ /[^A-Za-z0-9]/
          InvalidParser
        else
          eval "#{name.capitalize}Parser"
        end
      end

    end
  end
end

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