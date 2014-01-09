# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'preload/version'

Gem::Specification.new do |spec|
  spec.name          = "preload"
  spec.version       = Preload::VERSION
  spec.authors       = ["Logan Serman"]
  spec.email         = ["loganserman@gmail.com"]
  spec.description   = %q{Simple automatic resource loading for Ruby on Rails.}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/lserman/preload"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_development_dependency "activesupport", '>= 4'

end
