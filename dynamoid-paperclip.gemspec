# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dynamoid/paperclip/version'

Gem::Specification.new do |spec|
  spec.name          = "dynamoid-paperclip"
  spec.version       = Dynamoid::Paperclip::VERSION
  spec.authors       = ["Stefan Neculai"]
  spec.email         = ["stefan.neculai@gmail.com"]
  spec.description   = 'Dynamoid::Paperclip enables you to use Paperclip with the Dynamoid for DynamoDB.'
  spec.summary       = 'Dynamoid::Paperclip enables you to use Paperclip with the Dynamoid for DynamoDB.'
  spec.homepage      = "https://github.com/stefanneculai/dynamoid-paperclip"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency 'dynamoid'
  spec.add_dependency 'paperclip', '~> 6.1'
end
