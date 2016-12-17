# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec_key_value/version'

Gem::Specification.new do |spec|
  spec.name          = 'rspec_key_value'
  spec.version       = RspecKeyValue::VERSION
  spec.authors       = ['Alexander Todorov']
  spec.email         = ['atodorov@MrSenko.com']
  spec.homepage      = 'https://github.com/MrSenko/rspec_key_value'
  spec.license       = 'MIT'
  spec.summary       = 'Simple key:value formatter for rspec'
  spec.description   = <<-DESCRIPTION
A simple Rspec formatter which prints test results in the format
`R:group.sub_group.example_name` where R is -1 for PENDING, 0 for FAILED and 1 for PASS result.
Useful if you have to pipe Rspec output to a Bash script!
  DESCRIPTION
  spec.files = `git ls-files -z`.split("\x0").reject { |f|
    f.match(%r{^(test|spec|features)/})
  }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'rspec-lint'
end
