# frozen_string_literal: true

require_relative 'lib/ddbuffer/version'

Gem::Specification.new do |spec|
  spec.name          = 'ddbuffer'
  spec.version       = DDBuffer::VERSION
  spec.authors       = ['Denis Defreyne']
  spec.email         = ['denis.defreyne@stoneship.org']

  spec.summary       = 'Buffer enumerables'
  spec.homepage      = 'https://github.com/ddfreyne/ddbuffer'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0")
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
end
