Gem::Specification.new do |s|
  s.name        = 'wordpress_import'
  s.version     = '0.0.1'
  s.date        = '2016-01-22'
  s.summary     = "Import wordpress exports!"
  s.description = "Parse wordpress export file into structured ruby"
  s.authors     = ["Valentin Arkhipov"]
  s.email       = 'hello@madespecial.co.uk'
  s.files       = ["lib/wordpress_import.rb"]
  s.homepage    = 'https://github.com/adaline/wordpress_import'
  s.license     = 'MIT'
  s.add_dependency('nokogiri')
end
