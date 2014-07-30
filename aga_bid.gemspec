# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aga_bid/version'

Gem::Specification.new do |spec|
  spec.name          = "aga_bid"
  spec.version       = AgaBid::VERSION
  spec.authors       = ["刘梦晨"]
  spec.email         = ["mengchen.liu@corp.elong.com"]
  spec.description   = ""
  spec.summary       = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_dependency "db"
end
