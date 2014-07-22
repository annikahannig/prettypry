# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prettypry/version'

Gem::Specification.new do |spec|
  spec.name          = "prettypry"
  spec.version       = Prettypry::VERSION
  spec.authors       = ["Matthias Hannig"]
  spec.email         = ["hannig@trustner.com"]
  spec.summary       = %q{Adds jazz_hands functionaliy for ruby > 2.0}
  spec.homepage      = "https://github.com/trustner/prettypry"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  
  #
  # Runtime dependencies
  #
  
  # Pry
  spec.add_runtime_dependency 'pry'
  spec.add_runtime_dependency 'pry-rails'
  
  # Pretty Output Gems
  spec.add_runtime_dependency 'awesome_print'
  spec.add_runtime_dependency 'coolline'
  spec.add_runtime_dependency 'coderay'
  spec.add_runtime_dependency 'hirb'

end

