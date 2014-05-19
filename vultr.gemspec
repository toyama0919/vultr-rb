# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vultr/version'

Gem::Specification.new do |gem|
  gem.name          = 'vultr'
  gem.version       = Vultr::VERSION
  gem.authors       = ['Kevin Berry']
  gem.email         = ['kevin@opensourcealchemist.com']
  gem.description   = %q{A Ruby gem to interact with Vultr, a cloud hosting provider}
  gem.summary       = %q{This gem wraps the Vultr API documented at https://www.vultr.com/api/}
  gem.homepage      = 'https://github.com/deathsyn/vultr'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
  gem.has_rdoc      = 'yard'

  if RUBY_PLATFORM == 'java'
    gem.add_runtime_dependency 'jruby-openssl'
  end

  gem.add_dependency 'faraday', '~> 0.9.0'
  gem.add_dependency 'faraday_middleware', '~> 0.9.0'
  gem.add_dependency 'json'
  gem.add_dependency 'hashie', '~> 2.1.1'

  gem.add_development_dependency 'bacon', '~> 1.2.0'
  #gem.add_development_dependency 'guard'
  #gem.add_development_dependency 'guard-rspec'
  #gem.add_development_dependency 'rb-fsevent'

  gem.add_development_dependency 'vcr',     '~> 2.4'
  gem.add_development_dependency 'fakeweb', '~> 1.3.0'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'yard'
  gem.add_development_dependency 'coveralls'
end
