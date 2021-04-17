Gem::Specification.new do |spec|
  spec.name          = 'duration'
  spec.version       = '1.5'
  spec.summary       = %q(Ruby class representing a duration in time.)
  spec.authors       = ['Justin Bishop']
  spec.email         = ['jubishop@gmail.com']
  spec.homepage      = 'https://github.com/jubishop/duration'
  spec.license       = 'MIT'
  spec.files         = Dir['lib/**/*.rb'] + Dir['sig/**/*.rbs']
  spec.require_paths = ['lib']
  spec.bindir        = 'bin'
  spec.executables   = []
  spec.metadata      = {
    'source_code_uri' => 'https://github.com/jubishop/duration',
    'steep_types' => 'sig'
  }
  spec.required_ruby_version = Gem::Requirement.new('>= 3.0')
  spec.add_runtime_dependency('core')
  spec.add_runtime_dependency('linguistics')
end
