# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fibonacci_service"
  spec.version       = "1.0.0"
  spec.authors       = ["Kyle McGovern"]
  spec.email         = ["kyle.mcgovern@cerner.com"]

  spec.summary       = %q{Sinatra rest service that calcualtes a fibonacci sequence}
  spec.description   = %q{Sinatra rest service that calcualtes a fibonacci sequence}
  spec.homepage      = "https://github.com/spion06/fibonacci_service"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://localhost"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rack-test", "~> 0.6"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "sinatra", "~> 1.4"
end
