jekyll-pandoc
=============

[![Build Status](https://travis-ci.org/mfenner/jekyll-pandoc.svg)](https://travis-ci.org/mfenner/jekyll-pandoc)
[![Gem Version](https://badge.fury.io/rb/jekyll-pandoc.svg)](http://badge.fury.io/rb/jekyll-pandoc)

[Pandoc](http://johnmacfarlane.net/pandoc/) markdown converter for the [Jekyll](https://github.com/jekyll/jekyll) static site generator. Based on [jekyll-pandoc-plugin](https://github.com/dsanson/jekyll-pandoc-plugin) by David Sanson, but with some small changes, test coverage, and packaged as Ruby gem.

Jekyll-pandoc uses the [pandoc-ruby](https://github.com/alphabetum/pandoc-ruby) gem as a Ruby wrapper for Pandoc.

## Installation

Run `bundle install` after adding the gem to your Jekyll `Gemfile`:

    gem "jekyll-pandoc", "~> 0.0.1"

Or install as gem:

    [sudo] gem install jekyll-pandoc

## Configuration

Add the gem to `_config.yml`:

    gems:
      - jekyll-pandoc

Change the Jekyll markdown processor in `_config.yml`:

    markdown: pandoc

Additional pandoc options can be provided in `_config.yml`:

    pandoc:
      extensions:
        - smart
        - mathjax
        - csl: _styles/apa.csl
        - bibliography: bibliography/references.bib

## License
[MIT License](LICENSE).