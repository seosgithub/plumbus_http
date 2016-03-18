# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'plumbus_http/version'

Gem::Specification.new do |spec|
  spec.name          = "plumbus_http"
  spec.version       = PlumbusHttp::VERSION
  spec.authors       = ["seo"]
  spec.email         = ["seotownsend@icloud.com"]

  spec.summary       = "An http driver for plumbus"
  spec.homepage      = "https://github.com/sotownsend/plumbus_http"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rack", "~> 1.6"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
