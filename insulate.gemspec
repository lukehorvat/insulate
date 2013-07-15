# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'insulate/version'

Gem::Specification.new do |spec|
  spec.name          = "insulate"
  spec.version       = Insulate::VERSION
  spec.authors       = ["Luke Horvat"]
  spec.email         = ["lukehorvat@gmail.com"]
  spec.description   = %q{Simple page-specific JavaScript solution for small Ruby on Rails applications.}
  spec.summary       = %q{Simple page-specific JavaScript solution for small Rails apps.}
  spec.homepage      = "https://github.com/lukehorvat/insulate"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
