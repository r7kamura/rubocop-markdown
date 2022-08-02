# frozen_string_literal: true

module RuboCop
  module Markdown
    # Get 0-indexed position of the node from line and column based position.
    class Position
      # @param [Integer] column
      # @param [String] content
      # @param [Integer] line
      def initialize(
        column:,
        content:,
        line:
      )
        @column = column
        @content = content
        @line = line
      end

      # @return [Integer]
      def index
        @content.lines[...@line].join.length + @column - 1
      end
    end
  end
end
