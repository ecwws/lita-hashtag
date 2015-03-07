Gem::Specification.new do |spec|
  spec.name          = "lita-hashtag"
  spec.version       = "0.1.0"
  spec.authors       = ["Richard Li"]
  spec.email         = ["evilcat@wisewolfsolutions.com"]
  spec.description   = %q{Let lita bot respond to #'s}
  spec.summary       = %q{Let lita bot respond to #'s}
  spec.homepage      = "https://github.com/ecwws/lita-hashtag"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
