# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_social_bookmarks'
  s.version     = '1.1.2'

  s.summary     = 'Easily add social bookmarks to your spree app'
  s.description = 'Add (optional) gem description here'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Michael Bianco'
  s.email             = 'info@cliffsidedev.com'

  s.files         = `git ls-files`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.1'
end

