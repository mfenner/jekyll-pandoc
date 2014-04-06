# monkey patch Jekyll Markdown setup method for compatibility
module Jekyll
  module Converters
    class Markdown < Converters

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