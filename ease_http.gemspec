# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ease_http/version'

Gem::Specification.new do |spec|
  spec.name          = "ease_http"
  spec.version       = EaseHTTP::VERSION
  spec.authors       = ["reyesyang"]
  spec.email         = ["reyes.yang@gmail.com"]
  spec.licenses      = ['MIT']

  spec.summary       = %q{A Net::HTTP wrapper for esay to use}
  spec.description   = %q{A Net::HTTP wrapper for easy to use}
  spec.homepage      = "https://github.com/reyesyang/ease_http"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry", '~> 0.10.4'
end
