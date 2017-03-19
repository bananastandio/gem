# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bananastandio/version'

Gem::Specification.new do |spec|
  spec.name          = "bananastandio"
  spec.version       = ActivemodelFlags::VERSION
  spec.authors       = ["Jay El-Kaake"]
  spec.email         = ["jay@bananastand.io"]

  spec.summary       = %q{Provides a Ruby interface to interact with the Banana Stand developer API.}
  spec.description   = %q{Provides a Ruby interface to interact with the Banana Stand API. See https://www.bananastand.io/resources for more help.}
  spec.homepage      = "https://www.github.com/bananastandio/gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rails", ">= 4.0.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "temping", "~> 3.3.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", '~> 3.4'
  spec.add_development_dependency "sqlite3", '~> 1.3.11'

end
