require 'spec_helper'

describe Jekyll::Converters::Markdown::PandocParser do

  let(:config) {{ 'markdown' => 'pandoc',
                  'pandoc' => { 'extensions' => ["smart", "mathjax"] }}}
  let(:markdown) { "## This is a heading" }
  let(:html) { "<h2 id=\"this-is-a-heading\">This is a heading</h2>\n" }

  describe "pandoc-ruby" do
    subject { PandocRuby }

    it "should convert markdown" do
      subject.new(markdown).to_html.should eq(html)
    end
  end

  describe "class methods" do
    subject { Jekyll::Converters::Markdown::PandocParser }

    it "should initialize" do
      parser = subject.new(Jekyll::Configuration::DEFAULTS.merge(config))
      parser.public_methods.should include(:convert, :config_option)
    end
  end

  describe "instance methods" do
    subject { Jekyll::Converters::Markdown::PandocParser.new Jekyll::Configuration::DEFAULTS.merge(config) }

    describe "convert" do

      it "should convert markdown" do
        subject.convert(markdown).should eq(html)
      end
    end

    describe "convert with missing bibliography" do
      let(:config) {{ 'markdown' => 'pandoc',
                      'pandoc' => { 'extensions' => [{ 'bibliography' => 'bibliography/references.bib' }] }}}

      it "should convert markdown" do
        expect { subject.convert(markdown) }.to raise_error(Jekyll::Errors::FatalException, "Conversion returned empty string")
      end
    end

    describe "config_option" do
      it "should read config option" do
        opts = subject.config_option("extensions")
        opts.should eq(config['pandoc']['extensions'])
      end

      it "should read empty config option" do
        opts = subject.config_option("format")
        opts.should be_nil
      end

      it "should override config option" do
        opts = subject.config_option("format", "html5")
        opts.should eq("html5")
      end
    end
  end
end
