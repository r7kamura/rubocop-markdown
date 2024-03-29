# frozen_string_literal: true

require_relative 'lib/rubocop/markdown/version'

Gem::Specification.new do |spec|
  spec.name = 'rubocop-markdown'
  spec.version = RuboCop::Markdown::VERSION
  spec.authors = ['Ryo Nakamura']
  spec.email = ['r7kamura@gmail.com']

  spec.summary = 'RuboCop plugin for Ruby code blocks in Markdown.'
  spec.homepage = 'https://github.com/r7kamura/rubocop-markdown'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.7'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'commonmarker'
  spec.add_dependency 'rubocop', '~> 1.45'
end
