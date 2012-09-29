# -*- encoding: utf-8 -*-
require File.expand_path('../lib/quotey/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["psychocandy"]
  gem.email         = ["amirf@null.co.il"]
  gem.description   = %q{Quotey - A gem to generate random quotes}
  gem.summary       = %q{Generate random quotes for fun & profit}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "quotey"
  gem.require_paths = ["lib"]
  gem.version       = Quotey::VERSION

  gem.add_development_dependency "rspec", "~> 2.11"
end
