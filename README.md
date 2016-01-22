WordpressImport
===

WordpressImport parses [WordPress](http://www.wordpress.org) export files for use in Ruby, for example to replace an old WordPress site with a shiny new Ruby one!
***
Installation
---
Run in terminal:
`gem install wordpress_import`

Or add to Gemfile:

`gem 'wordpress_import'`
***
Usage
---
```ruby
require 'wordpress_import'

# Read file
content = File.read('/tmp/wordpress_export.xml')
# Parse file
wp = WordpressImport.new(content)

# Access content within
authors = wp.authors
tags = wp.tags
categories = wp.categories
attachments = wp.items.select { |i| i.class == WordpressImport::Attachment }
about_pages = wp.items.select { |i| i.class == WordpressImport::About }
posts = wp.items.select { |i| i.class == WordpressImport::Post }
```
***
Things to look out for
---
* This gem will load all data into memory, although I had no problems with this and chose to keep it simple - with a big enough export you may run into issues.

* There is no test suite, there is not much to test. The code in this gem is very simple and I hope the clean layout will make it trivial for you to change this code to suit your needs.
