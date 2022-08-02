# frozen_string_literal: true

require 'commonmarker'
require 'rubocop'

module RuboCop
  module Markdown
    # Extract Ruby codes from Markdown template.
    class RubyExtractor
      SUPPORTED_EXTENSIONS = %w[
        .markdown
        .md
      ].freeze

      SUPPORTED_LANGUAGES = %w[
        rb
        ruby
      ].freeze

      class << self
        # @param [RuboCop::ProcessedSource] processed_source
        # @return [Array<RuboCop::ProcessedSource>, nil]
        def call(processed_source)
          new(processed_source).call
        end
      end

      # @param [RuboCop::ProcessedSource] processed_source
      def initialize(processed_source)
        @processed_source = processed_source
      end

      # @return [Array<RuboCop::ProcessedSource>, nil]
      def call
        return unless supported_file_path_pattern?

        code_blocks.map do |code_block|
          {
            offset: ::RuboCop::Markdown::Position.new(
              column: code_block.sourcepos[:start_column],
              content: template_source,
              line: code_block.sourcepos[:start_line]
            ).index,
            processed_source: ::RuboCop::ProcessedSource.new(
              code_block.string_content,
              @processed_source.ruby_version,
              file_path
            )
          }
        end
      end

      private

      # @return [Array<CommonMarker::Node>]
      def code_blocks
        nodes = []
        root.walk do |node|
          nodes << node if node.type == :code_block && SUPPORTED_LANGUAGES.include?(node.fence_info)
        end
        nodes
      end

      # @return [CommonMarker::Node]
      def root
        @root ||= ::CommonMarker.render_doc(template_source)
      end

      # @return [String, nil]
      def file_path
        @processed_source.path
      end

      # @return [Boolean]
      def supported_file_path_pattern?
        SUPPORTED_EXTENSIONS.any? do |supported_extension|
          file_path.end_with?(supported_extension)
        end
      end

      # @return [String]
      def template_source
        @processed_source.raw_source
      end
    end
  end
end
