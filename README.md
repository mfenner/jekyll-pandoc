jekyll-pandoc
=============

[Pandoc](http://johnmacfarlane.net/pandoc/) markdown converter for the [Jekyll](https://github.com/jekyll/jekyll) static site generator. Based on [jekyll-pandoc-plugin](https://github.com/dsanson/jekyll-pandoc-plugin) by David Sanson, but with some small changes, and packaged as Ruby gem.

## Installation

Run `bundle install` after adding the gem to your Jekyll `Gemfile`:

    gem "jekyll-pandoc", "~> 0.0.1"

Or install as gem:

    [sudo] gem install jekyll-pandoc

## Configuration

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
MIT License, see [LICENSE] for more information.