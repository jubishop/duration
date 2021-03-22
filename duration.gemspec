Gem::Specification.new do |spec|
  spec.name          = "duration"
  spec.version       = "1.1"
  spec.date          = "2020-06-16"
  spec.summary       = %q{Ruby class representing a duration in time}
  spec.authors       = ["Justin Bishop"]
  spec.email         = ["jubishop@gmail.com"]
  spec.homepage      = "https://github.com/jubishop/duration"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0")
  spec.metadata["source_code_uri"] = "https://github.com/jubishop/duration"
  spec.files         = Dir["lib/**/*.rb"]
  spec.add_runtime_dependency 'core'
  spec.require_paths = ["lib"]
  spec.metadata      = {
    "steep_types" => "sig"
  }
end
