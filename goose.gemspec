$:.unshift File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name          = "goose"
  s.version       = "0.0.1"
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["Tom Bombadil" ]
  s.email         = ["amanibhavam@destructuring.org" ]
  s.homepage      = "https://github.com/destructuring/goose"
  s.summary       = "Golden Ubuntu images"
  s.description   = "Golden Ubuntu images"

  s.required_rubygems_version = ">= 1.3.6"

  s.files         = 'lib'
  s.require_path  = 'lib'
end
