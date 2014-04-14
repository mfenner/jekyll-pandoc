jekyll-pandoc
=============

[![Build Status](https://travis-ci.org/mfenner/jekyll-pandoc.svg)](https://travis-ci.org/mfenner/jekyll-pandoc)
[![Gem Version](https://badge.fury.io/rb/jekyll-pandoc.svg)](http://badge.fury.io/rb/jekyll-pandoc)
[![Code Climate](https://codeclimate.com/github/mfenner/jekyll-pandoc.png)](https://codeclimate.com/github/mfenner/jekyll-pandoc)

[Pandoc](http://johnmacfarlane.net/pandoc/) markdown converter for the [Jekyll](https://github.com/jekyll/jekyll) static site generator. Based on [jekyll-pandoc-plugin](https://github.com/dsanson/jekyll-pandoc-plugin) by David Sanson, but with some small changes, test coverage, and packaged as Ruby gem.

Jekyll-pandoc uses the [pandoc-ruby](https://github.com/alphabetum/pandoc-ruby) gem as a Ruby wrapper for Pandoc.

## Installation

Run `bundle install` after adding the gem to your Jekyll `Gemfile`:

    gem "jekyll-pandoc", "~> 0.0.1"

If you are not using Bundler, install as gem:

    [sudo] gem install jekyll-pandoc

## Configuration

Add the gem to the Jekyll `_config.yml`:

    gems:
      - jekyll-pandoc

Change the markdown processor in the Jekyll `_config.yml`:

    markdown: pandoc

Additional pandoc options can be provided in the Jekyll `_config.yml`:

    pandoc:
      extensions:
        - smart
        - mathjax
        - csl: _styles/apa.csl
        - bibliography: bibliography/references.bib

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
[MIT License](LICENSE).
