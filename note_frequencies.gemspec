# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'note_frequencies/version'

Gem::Specification.new do |spec|
  spec.name          = "note_frequencies"
  spec.version       = NoteFrequencies::VERSION
  spec.authors       = ["Choan Gálvez"]
  spec.email         = ["choan.galvez@gmail.com"]
  spec.description   = %q{Convert musical note names to frequencies}
  spec.summary       = %q{A tool for converting musical note names to it vibrating frequencies. Accepts input in both Helmholtz (`a'`, `a,`) and scientific notation (`a4`, `a3`)}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 2.2.10"
  spec.add_development_dependency "rake"
end
