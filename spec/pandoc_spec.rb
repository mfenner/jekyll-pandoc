require 'spec_helper'

describe Jekyll::Converters::Markdown::Pandoc do
  let(:config) {{ 'markdown' => 'Pandoc',
                  'pandoc' => { 'extensions' => ["smart", "mathjax"] }}}
  let(:markdown) { "## This is a heading" }
  let(:html) { "<h2 id=\"this-is-a-heading\">This is a heading</h2>\n" }

  describe "pandoc-ruby" do
    subject { PandocRuby }

    it "should convert markdown" do
      expect(subject.new(markdown).to_html).to eq(html)
    end
  end

  describe "class methods" do
    subject { Jekyll::Converters::Markdown::Pandoc }

    it "should initialize" do
      parser = subject.new(Jekyll::Configuration::DEFAULTS.merge(config))
      expect(parser.public_methods).to include(:convert, :config_option)
    end
  end

  describe "instance methods" do
    subject { Jekyll::Converters::Markdown::Pandoc.new Jekyll::Configuration::DEFAULTS.merge(config) }

    describe "convert" do
      it "should convert markdown" do
        expect(subject.convert(markdown)).to eq(html)
      end

      it "should convert empty string" do
        expect(subject.convert("")).to eq("\n")
      end
    end

    describe "convert with missing bibliography" do
      let(:config) {{ 'markdown' => 'Pandoc',
                      'pandoc' => { 'extensions' => [{ 'bibliography' => 'bibliography/references.bib' }] }}}

      it "should convert markdown" do
        expect { subject.convert(markdown) }.to raise_error(RuntimeError, /Could not find bibliography/)
      end
    end

    describe "config_option" do
      it "should read config option" do
        opts = subject.config_option("extensions")
        expect(opts).to eq(config['pandoc']['extensions'])
      end

      it "should read empty config option" do
        opts = subject.config_option("format")
        expect(opts).to be_nil
      end

      it "should override config option" do
        opts = subject.config_option("format", "html5")
        expect(opts).to eq("html5")
      end
    end
  end
end
