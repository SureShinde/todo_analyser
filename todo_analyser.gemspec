# frozen_string_literal: true

require_relative 'lib/todo_analyser/version'

Gem::Specification.new do |spec|
  spec.name = 'todo_analyser'
  spec.version = TodoAnalyser::VERSION
  spec.authors = ['Suresh Shinde']
  spec.email = ['sureshindes@gmail.com']

  spec.summary = 'To-Do List Parser to parse the TODOs status from list'
  spec.description = 'To-Do List Parser to parse the TODOs for even numbered items from list'
  spec.homepage = 'https://github.com/sureshinde/todo_analyser'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['allowed_push_host'] = 'http://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/sureshinde/todo_analyser.git'
  spec.metadata['changelog_uri'] = 'https://github.com/sureshinde/todo_analyser/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
