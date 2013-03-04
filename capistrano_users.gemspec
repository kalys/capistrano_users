# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano_users/version'

Gem::Specification.new do |gem|
  gem.name          = "capistrano_users"
  gem.version       = CapistranoUsers::VERSION
  gem.authors       = ["Kalys Osmonov"]
  gem.email         = ["kalys@osmonov.com"]
  gem.description   = %q{Gem contains capistrano recipies for managing groups.}
  gem.summary       = %q{The following tasks are supported: cap users:add_to_group, cap users:groups, cap users:remove_from_group.}
  gem.homepage      = "https://github.com/kalys/capistrano_users"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'capistrano'
  gem.add_development_dependency 'rake'
end
