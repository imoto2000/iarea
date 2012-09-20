# -*- coding: utf-8 -*-

require File.expand_path('../lib/iarea/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Masaki Sawamura"]
  gem.email         = ["masaki.sw@gmail.com"]
  gem.description   = %q{get open i-area data}
  gem.summary       = %q{find open i-area mesh from latitude,longitude }
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "iarea"
  gem.require_paths = ["lib"]
  gem.version       = IArea::VERSION

  gem.add_development_dependency "rspec"
end
