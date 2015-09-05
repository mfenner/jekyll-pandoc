require 'spec_helper'

describe Jekyll::Converters::Markdown do

  describe "default parser" do
    subject { Jekyll::Converters::Markdown.new Jekyll::Configuration::DEFAULTS }

    it "should setup parser" do
      subject.setup.should be_true
    end
  end

  describe "rdiscount parser" do
    subject { Jekyll::Converters::Markdown.new Jekyll::Configuration::DEFAULTS.merge({ 'markdown' => 'rdiscount' }) }

    it "should setup parser" do
      subject.setup.should be_true
    end
  end

  describe "pandoc parser" do
    subject { Jekyll::Converters::Markdown.new Jekyll::Configuration::DEFAULTS.merge({ 'markdown' => 'pandoc' }) }

    it "should setup parser" do
      subject.setup.should be_true
    end
  end

  describe "invalid parser" do
    subject { Jekyll::Converters::Markdown.new Jekyll::Configuration::DEFAULTS.merge({ 'markdown' => 'pandoc!' }) }

    it "should not setup parser" do
      expect { subject.setup }.to raise_error(Jekyll::Errors::FatalException, "Invalid Markdown Processor: pandoc!")
    end
  end

end
