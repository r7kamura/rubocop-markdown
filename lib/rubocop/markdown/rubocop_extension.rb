# frozen_string_literal: true

require 'rubocop'

RuboCop::Runner.ruby_extractors.unshift(RuboCop::Markdown::RubyExtractor)

RuboCop::ConfigLoader.instance_variable_set(
  :@default_configuration,
  RuboCop::Markdown::ConfigLoader.call
)
