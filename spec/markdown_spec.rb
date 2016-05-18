require 'spec_helper'

describe Jekyll::Converters::Markdown do

  describe "default parser" do
    subject { Jekyll::Converters::Markdown.new Jekyll::Configuration::DEFAULTS }

    it "should setup parser" do
      expect(subject.setup).to be true
    end
  end

  describe "pandoc parser" do
    subject { Jekyll::Converters::Markdown.new Jekyll::Configuration::DEFAULTS.merge({ 'markdown' => 'Pandoc' }) }

    it "should setup parser" do
      expect(subject.setup).to be true
    end
  end

  describe "invalid parser" do
    subject { Jekyll::Converters::Markdown.new Jekyll::Configuration::DEFAULTS.merge({ 'markdown' => 'Pandoc!' }) }

    it "should not setup parser" do
      expect { subject.setup }.to raise_error(Jekyll::Errors::FatalException, "Bailing out; invalid Markdown processor.")
    end
  end

end
