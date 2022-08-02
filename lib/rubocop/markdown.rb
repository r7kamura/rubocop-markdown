# frozen_string_literal: true

module RuboCop
  module Markdown
    autoload :ConfigLoader, 'rubocop/markdown/config_loader'
    autoload :Position, 'rubocop/markdown/position'
    autoload :RubyExtractor, 'rubocop/markdown/ruby_extractor'
  end
end

require_relative 'markdown/rubocop_extension'
require_relative 'markdown/version'
