CSSx
====


CSSx is a simple command line utility written in Ruby that builds a stylesheet using only the classes and ids in use in a given HTML page. You'll need [nokogiri](http://rubygems.org/gems/nokogiri) and [css_parser](https://github.com/premailer/css_parser).

You pass two arguments: an HTML file and a CSS file. The utility will output a clean new stylesheet called _newStyles.css_. 

	ruby cssx.rb index.html styles.css

This may be useful if you're building HTML prototypes that become unmanageable after several iterations and you find yourself wanting to start over with a fresh stylesheet.





