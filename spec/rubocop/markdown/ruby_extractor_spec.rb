# frozen_string_literal: true

RSpec.describe RuboCop::Markdown::RubyExtractor do
  describe '.call' do
    subject do
      described_class.call(processed_source)
    end

    let(:processed_source) do
      RuboCop::ProcessedSource.new(
        source,
        3.1,
        file_path
      )
    end

    let(:file_path) do
      'dummy.markdown'
    end

    let(:source) do
      <<~MARKDOWN
        foo

        ```ruby
        foo = 1
        ```

        bar

        ```
        non ruby code block
        ```
      MARKDOWN
    end

    context 'with valid condition' do
      it 'returns Ruby codes with offset' do
        result = subject
        expect(result.length).to eq(1)
        expect(result[0][:processed_source].raw_source).to eq("foo = 1\n")
        expect(result[0][:offset]).to eq(13)
      end
    end
  end
end
