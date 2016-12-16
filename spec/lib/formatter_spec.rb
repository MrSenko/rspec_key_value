require 'ostruct'
require 'spec_helper'
require 'rspec_key_value/formatter'

RSpec.describe RspecKeyValue::Formatter do
  let(:output) { StringIO.new }
  subject(:formatter) { described_class.new(output) }

  shared_examples_for 'a test line' do
    it { is_expected.to include(formatter.send(:clean_string, notification.example.description)) }

    context 'a nested example group' do
      let(:parent_groups) do
        [
          'My group',
          'my subgroup'
        ]
      end

      it { is_expected.to include(formatter.send(:current_group, ['My group', 'my subgroup'])) }
    end
  end

  describe '#example_passed' do
    before do
      formatter.instance_variable_set(
        :@groups, parent_groups
      )
      formatter.example_passed(notification)
    end

    subject(:output_string) { output.string }

    let(:parent_groups) { [] }

    let(:notification) do
      OpenStruct.new(
        example: OpenStruct.new(description: 'An test')
      )
    end

    it { is_expected.to start_with('1:') }
    it_behaves_like 'a test line'
  end

  describe '#example_failed' do
    before do
      formatter.instance_variable_set(
        :@groups, parent_groups
      )
      formatter.example_failed(notification)
    end

    subject(:output_string) { output.string }

    let(:parent_groups) { [] }

    let(:notification) do
      Class.new do
        def example
          OpenStruct.new(description: 'An test')
        end

        def fully_formatted(_number = nil)
          'A full test error message'
        end
      end.new
    end

    it { is_expected.to start_with('0:') }
    it_behaves_like 'a test line'
  end

  describe '#example_pending' do
    before do
      formatter.instance_variable_set(
        :@groups, parent_groups
      )
      formatter.example_pending(notification)
    end

    subject(:output_string) { output.string }

    let(:parent_groups) { [] }

    let(:notification) do
      OpenStruct.new(
        example: OpenStruct.new(description: 'An test')
      )
    end

    it { is_expected.to start_with('-1:') }
    it_behaves_like 'a test line'
  end
end
